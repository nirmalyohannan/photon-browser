import 'package:injectable/injectable.dart';
import 'package:isar_community/isar.dart';
import '../../domain/entities/browser_tab.dart';
import '../../domain/repositories/browser_repository.dart';
import '../models/browser_tab_collection.dart';

@LazySingleton(as: BrowserRepository)
class BrowserRepositoryImpl implements BrowserRepository {
  final Isar _isar;

  BrowserRepositoryImpl(this._isar);

  @override
  Future<void> saveSession(List<BrowserTab> tabs) async {
    // Filter out incognito tabs and map to collection
    final tabCollections = tabs
        .where((t) => !t.isIncognito)
        .map((t) => BrowserTabCollection.fromDomain(t))
        .toList();

    await _isar.writeTxn(() async {
      // Clear previous specific session or just overwrite?
      // Since we want to mirror the current state:
      // 1. Clear all old tabs (or smart diff, but clear is safer for strict sync)
      // 2. Put all new tabs
      await _isar.browserTabCollections.clear();
      await _isar.browserTabCollections.putAll(tabCollections);
    });
  }

  @override
  Future<List<BrowserTab>> restoreSession() async {
    final collections = await _isar.browserTabCollections.where().findAll();
    return collections.map((c) => c.toDomain()).toList();
  }

  @override
  Future<void> clearSession() async {
    await _isar.writeTxn(() async {
      await _isar.browserTabCollections.clear();
    });
  }
}
