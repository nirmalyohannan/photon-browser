import 'package:equatable/equatable.dart';
import '../../domain/entities/browser_tab.dart';

enum BrowserStatus { initial, loading, success, failure }

enum BrowserNavigationAction { none, goBack, goForward }

class BrowserState extends Equatable {
  final BrowserStatus status;
  final List<BrowserTab> tabs;
  final int activeTabIndex;
  final BrowserNavigationAction navigationAction;
  final String? navigationTargetTabId;

  const BrowserState({
    this.status = BrowserStatus.initial,
    this.tabs = const [],
    this.activeTabIndex = 0,
    this.navigationAction = BrowserNavigationAction.none,
    this.navigationTargetTabId,
  });

  BrowserTab? get activeTab {
    if (tabs.isEmpty || activeTabIndex < 0 || activeTabIndex >= tabs.length) {
      return null;
    }
    return tabs[activeTabIndex];
  }

  BrowserState copyWith({
    BrowserStatus? status,
    List<BrowserTab>? tabs,
    int? activeTabIndex,
    BrowserNavigationAction? navigationAction,
    String? navigationTargetTabId,
  }) {
    return BrowserState(
      status: status ?? this.status,
      tabs: tabs ?? this.tabs,
      activeTabIndex: activeTabIndex ?? this.activeTabIndex,
      navigationAction: navigationAction ?? BrowserNavigationAction.none,
      navigationTargetTabId: navigationTargetTabId,
    );
  }

  @override
  List<Object?> get props => [
    status,
    tabs,
    activeTabIndex,
    navigationAction,
    navigationTargetTabId,
  ];
}
