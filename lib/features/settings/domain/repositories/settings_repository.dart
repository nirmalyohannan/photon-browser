abstract class SettingsRepository {
  Future<String> getSearchEngineUrl();
  Future<void> setSearchEngineUrl(String url);
}
