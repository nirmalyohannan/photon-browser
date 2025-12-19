import '../entities/browser_tab.dart';

abstract class BrowserRepository {
  /// Saves the current list of tabs to persistent storage (for session restoration).
  /// Should NOT save incognito tabs.
  Future<void> saveSession(List<BrowserTab> tabs, int activeIndex);

  /// Restores the previous session's tabs and the index of the active tab.
  Future<(List<BrowserTab>, int)> restoreSession();

  /// Clears the saved session.
  Future<void> clearSession();
}
