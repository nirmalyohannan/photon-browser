import 'package:equatable/equatable.dart';
import '../../domain/entities/browser_tab.dart';

enum BrowserStatus { initial, loading, success, failure }

class BrowserState extends Equatable {
  final BrowserStatus status;
  final List<BrowserTab> tabs;
  final int activeTabIndex;

  const BrowserState({
    this.status = BrowserStatus.initial,
    this.tabs = const [],
    this.activeTabIndex = 0,
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
  }) {
    return BrowserState(
      status: status ?? this.status,
      tabs: tabs ?? this.tabs,
      activeTabIndex: activeTabIndex ?? this.activeTabIndex,
    );
  }

  @override
  List<Object?> get props => [status, tabs, activeTabIndex];
}
