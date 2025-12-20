import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/browser_tab.dart';
import '../../domain/usecases/create_tab_usecase.dart';
import '../../domain/usecases/load_url_usecase.dart';
import '../../domain/usecases/close_tab_usecase.dart';
import '../../domain/repositories/browser_repository.dart';
import 'browser_event.dart';
import 'browser_state.dart';

@injectable
class BrowserBloc extends Bloc<BrowserEvent, BrowserState> {
  final CreateTabUseCase _createTabUseCase;
  final LoadUrlUseCase _loadUrlUseCase;
  final CloseTabUseCase _closeTabUseCase;
  final BrowserRepository _browserRepository;

  BrowserBloc(
    this._createTabUseCase,
    this._loadUrlUseCase,
    this._closeTabUseCase,
    this._browserRepository,
  ) : super(const BrowserState()) {
    on<BrowserInitialized>(_onInitialized);
    on<BrowserTabCreated>(_onTabCreated);
    on<BrowserTabClosed>(_onTabClosed);
    on<BrowserTabSelected>(_onTabSelected);
    on<BrowserLoadUrl>(_onLoadUrl);
    on<BrowserUrlChanged>(_onUrlChanged);
    on<BrowserTitleChanged>(_onTitleChanged);
    on<BrowserFaviconChanged>(_onFaviconChanged);
    on<BrowserHistoryUpdated>(_onHistoryUpdated);

    add(BrowserInitialized());

    on<BrowserGoBack>((event, emit) {
      final tabId = event.tabId ?? state.activeTab?.id;
      if (tabId != null) {
        emit(
          state.copyWith(
            navigationAction: BrowserNavigationAction.goBack,
            navigationTargetTabId: tabId,
          ),
        );
        // We should reset it immediately after?
        // Or rely on listener to consume it?
        // If we reset immediately, listener might miss it.
        // Better to let listener react, but that's tricky with Bloc.
        // Alternative: emit state with proper action, then emit state with none.
        // But emit is async-ish.
        // Let's rely on cleaning it up with a specific event `BrowserNavigationConsumed` or just letting it be replaced by next action.
        // But if we click "Back" twice, state might not change enough if we don't reset.
        // So reset is needed.
        add(const BrowserNavigationConsumed());
      }
    });

    on<BrowserGoForward>((event, emit) {
      final tabId = event.tabId ?? state.activeTab?.id;
      if (tabId != null) {
        emit(
          state.copyWith(
            navigationAction: BrowserNavigationAction.goForward,
            navigationTargetTabId: tabId,
          ),
        );
        add(const BrowserNavigationConsumed());
      }
    });

    on<BrowserNavigationConsumed>((event, emit) {
      emit(
        state.copyWith(
          navigationAction: BrowserNavigationAction.none,
          navigationTargetTabId: null,
        ),
      );
    });

    on<BrowserCaptureScreenshot>((event, emit) {
      emit(state.copyWith(captureScreenshotTabId: event.tabId));
      // We need to consume it eventually? No, the view should consume it by dispatching captured.
      // Or we can reset it after short delay? No.
      // Best to have a "BrowserScreenshotConsumed" but for now let's rely on view acting on it quickly.
    });

    on<BrowserScreenshotUpdated>((event, emit) {
      final newTabs = state.tabs.map((t) {
        if (t.id == event.tabId) {
          return t.copyWith(screenshotPath: event.path);
        }
        return t;
      }).toList();
      emit(state.copyWith(tabs: newTabs, clearCaptureScreenshotTabId: true));
      // Persist session to save the screenshot path
      _browserRepository.saveSession(newTabs, state.activeTabIndex);
    });
  }

  Future<void> _onUrlChanged(
    BrowserUrlChanged event,
    Emitter<BrowserState> emit,
  ) async {
    final newTabs = state.tabs.map((t) {
      if (t.id == event.tabId) {
        return t.copyWith(
          url: event.url,
          isLoading: false,
        ); // Loading done? Or depends on event?
      }
      return t;
    }).toList();
    emit(state.copyWith(tabs: newTabs));
    // Persist session
    _browserRepository.saveSession(newTabs, state.activeTabIndex);
  }

  Future<void> _onTitleChanged(
    BrowserTitleChanged event,
    Emitter<BrowserState> emit,
  ) async {
    final newTabs = state.tabs.map((t) {
      if (t.id == event.tabId) {
        return t.copyWith(title: event.title);
      }
      return t;
    }).toList();
    emit(state.copyWith(tabs: newTabs));
    _browserRepository.saveSession(newTabs, state.activeTabIndex);
  }

  Future<void> _onFaviconChanged(
    BrowserFaviconChanged event,
    Emitter<BrowserState> emit,
  ) async {
    final newTabs = state.tabs.map((t) {
      if (t.id == event.tabId) {
        return t.copyWith(favicon: event.favicon);
      }
      return t;
    }).toList();
    emit(state.copyWith(tabs: newTabs));
    _browserRepository.saveSession(newTabs, state.activeTabIndex);
  }

  Future<void> _onHistoryUpdated(
    BrowserHistoryUpdated event,
    Emitter<BrowserState> emit,
  ) async {
    final newTabs = state.tabs.map((t) {
      if (t.id == event.tabId) {
        return t.copyWith(
          canGoBack: event.canGoBack,
          canGoForward: event.canGoForward,
        );
      }
      return t;
    }).toList();
    emit(state.copyWith(tabs: newTabs));
  }

  Future<void> _onLoadUrl(
    BrowserLoadUrl event,
    Emitter<BrowserState> emit,
  ) async {
    final targetTabId = event.tabId ?? state.activeTab?.id;
    if (targetTabId == null) return;

    final processedUrl = await _loadUrlUseCase(event.url);

    final newTabs = state.tabs.map((t) {
      if (t.id == targetTabId) {
        return t.copyWith(url: processedUrl, isLoading: true);
      }
      return t;
    }).toList();

    emit(state.copyWith(tabs: newTabs));
  }

  Future<void> _onInitialized(
    BrowserInitialized event,
    Emitter<BrowserState> emit,
  ) async {
    emit(state.copyWith(status: BrowserStatus.loading));
    try {
      final session = await _browserRepository.restoreSession();
      final tabs = session.$1;
      final activeIndex = session.$2;
      if (tabs.isEmpty) {
        final newTab = _createTabUseCase();
        emit(
          state.copyWith(
            status: BrowserStatus.success,
            tabs: [newTab],
            activeTabIndex: 0,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: BrowserStatus.success,
            tabs: tabs,
            activeTabIndex: activeIndex,
          ),
        );
      }
    } catch (_) {
      // On error, create default tab
      final newTab = _createTabUseCase();
      emit(
        state.copyWith(
          status: BrowserStatus.success,
          tabs: [newTab],
          activeTabIndex: 0,
        ),
      );
    }
  }

  Future<void> _onTabCreated(
    BrowserTabCreated event,
    Emitter<BrowserState> emit,
  ) async {
    final processedUrl = event.url != null
        ? await _loadUrlUseCase(event.url!)
        : null;
    final newTab = _createTabUseCase(
      url: processedUrl,
      isIncognito: event.isIncognito,
    );
    final newTabs = List<BrowserTab>.from(state.tabs)..add(newTab);
    emit(
      state.copyWith(
        tabs: newTabs,
        activeTabIndex: newTabs.length - 1, // Switch to new tab
      ),
    );
    // Persist session if not incognito? Or defer?
    _browserRepository.saveSession(newTabs, newTabs.length - 1);
  }

  Future<void> _onTabClosed(
    BrowserTabClosed event,
    Emitter<BrowserState> emit,
  ) async {
    // Basic logic: if we close the active tab, switch to the previous one
    final tabIndex = state.tabs.indexWhere((t) => t.id == event.tabId);
    if (tabIndex == -1) return;

    final newTabs = _closeTabUseCase(state.tabs, event.tabId);
    int newActiveIndex = state.activeTabIndex;

    if (newTabs.isEmpty) {
      // Create a new tab if we closed the last one
      final newTab = _createTabUseCase();
      newTabs.add(newTab);
      newActiveIndex = 0;
    } else {
      if (state.activeTabIndex >= newTabs.length) {
        newActiveIndex = newTabs.length - 1;
      } else if (state.activeTabIndex > tabIndex) {
        newActiveIndex--;
      }
    }

    emit(state.copyWith(tabs: newTabs, activeTabIndex: newActiveIndex));
    _browserRepository.saveSession(newTabs, newActiveIndex);
  }

  Future<void> _onTabSelected(
    BrowserTabSelected event,
    Emitter<BrowserState> emit,
  ) async {
    final index = state.tabs.indexWhere((t) => t.id == event.tabId);
    if (index != -1) {
      emit(state.copyWith(activeTabIndex: index));
      _browserRepository.saveSession(state.tabs, index);
    }
  }
}
