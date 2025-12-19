import 'package:injectable/injectable.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

// Import all collections
import '../../features/browser/data/models/browser_tab_collection.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Uuid get uuid => const Uuid();

  @preResolve
  Future<Isar> get isar async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open([BrowserTabCollectionSchema], directory: dir.path);
  }
}
