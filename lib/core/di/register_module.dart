import 'package:injectable/injectable.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

// Import all collections
import '../../features/settings/data/models/app_settings.dart';
import '../../features/browser/data/models/browser_tab_collection.dart';
import '../../features/history/data/models/history_entry.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Uuid get uuid => const Uuid();

  @preResolve
  Future<Isar> get isar async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open([
      BrowserTabCollectionSchema,
      HistoryEntrySchema,
      AppSettingsSchema,
    ], directory: dir.path);
  }
}
