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
  final String? captureScreenshotTabId;

  const BrowserState({
    this.status = BrowserStatus.initial,
    this.tabs = const [],
    this.activeTabIndex = 0,
    this.navigationAction = BrowserNavigationAction.none,
    this.navigationTargetTabId,
    this.captureScreenshotTabId,
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
    String? captureScreenshotTabId,
    bool clearCaptureScreenshotTabId = false,
  }) {
    return BrowserState(
      status: status ?? this.status,
      tabs: tabs ?? this.tabs,
      activeTabIndex: activeTabIndex ?? this.activeTabIndex,
      navigationAction: navigationAction ?? BrowserNavigationAction.none,
      navigationTargetTabId:
          navigationTargetTabId ?? this.navigationTargetTabId,
      captureScreenshotTabId: clearCaptureScreenshotTabId
          ? null
          : (captureScreenshotTabId ?? this.captureScreenshotTabId),
    );
  }

  @override
  List<Object?> get props => [
    status,
    tabs,
    activeTabIndex,
    navigationAction,
    navigationTargetTabId,
    captureScreenshotTabId,
  ];
}
