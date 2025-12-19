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
  Future<void> saveSession(List<BrowserTab> tabs, int activeIndex) async {
    // Filter out incognito tabs and map to collection
    final tabCollections = <BrowserTabCollection>[];
    for (int i = 0; i < tabs.length; i++) {
      if (!tabs[i].isIncognito) {
        final collection = BrowserTabCollection.fromDomain(tabs[i]);
        if (i == activeIndex) {
          collection.isLastActive = true;
        }
        tabCollections.add(collection);
      }
    }

    await _isar.writeTxn(() async {
      await _isar.browserTabCollections.clear();
      await _isar.browserTabCollections.putAll(tabCollections);
    });
  }

  @override
  Future<(List<BrowserTab>, int)> restoreSession() async {
    final collections = await _isar.browserTabCollections.where().findAll();
    if (collections.isEmpty) {
      return (<BrowserTab>[], 0);
    }

    final tabs = collections.map((c) => c.toDomain()).toList();
    var activeIndex = 0;

    // Find the tab that was last active
    for (int i = 0; i < collections.length; i++) {
      if (collections[i].isLastActive) {
        activeIndex = i;
        break;
      }
    }

    return (tabs, activeIndex);
  }

  @override
  Future<void> clearSession() async {
    await _isar.writeTxn(() async {
      await _isar.browserTabCollections.clear();
    });
  }
}
