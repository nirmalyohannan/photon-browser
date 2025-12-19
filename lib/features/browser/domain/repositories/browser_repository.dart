import '../entities/browser_tab.dart';

abstract class BrowserRepository {
  /// Saves the current list of tabs to persistent storage (for session restoration).
  /// Should NOT save incognito tabs.
  Future<void> saveSession(List<BrowserTab> tabs);

  /// Restores the previous session's tabs.
  Future<List<BrowserTab>> restoreSession();

  /// Clears the saved session.
  Future<void> clearSession();
}
