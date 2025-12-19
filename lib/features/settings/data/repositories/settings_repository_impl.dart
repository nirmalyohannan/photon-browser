import 'package:injectable/injectable.dart';
import 'package:isar_community/isar.dart';
import '../../domain/repositories/settings_repository.dart';
import '../models/app_settings.dart';

@LazySingleton(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  final Isar _isar;

  SettingsRepositoryImpl(this._isar);

  Future<AppSettings> _getSettings() async {
    final settings = await _isar.appSettings.where().findFirst();
    if (settings == null) {
      final newSettings = AppSettings()
        ..searchEngineUrl = 'https://www.google.com/search?q=';
      await _isar.writeTxn(() async {
        await _isar.appSettings.put(newSettings);
      });
      return newSettings;
    }
    return settings;
  }

  @override
  Future<String> getSearchEngineUrl() async {
    final settings = await _getSettings();
    return settings.searchEngineUrl;
  }

  @override
  Future<void> setSearchEngineUrl(String url) async {
    final settings = await _getSettings();
    settings.searchEngineUrl = url;
    await _isar.writeTxn(() async {
      await _isar.appSettings.put(settings);
    });
  }
}
