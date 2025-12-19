import 'package:injectable/injectable.dart';
import 'package:isar_community/isar.dart';
import '../../domain/repositories/history_repository.dart';
import '../models/history_entry.dart';

@LazySingleton(as: HistoryRepository)
class HistoryRepositoryImpl implements HistoryRepository {
  final Isar _isar;

  HistoryRepositoryImpl(this._isar);

  @override
  Future<List<HistoryEntry>> getHistory() async {
    return _isar.historyEntrys.where().sortByTimestampDesc().findAll();
  }

  @override
  Future<void> addEntry(String url, String title) async {
    final entry = HistoryEntry()
      ..url = url
      ..title = title
      ..timestamp = DateTime.now();

    await _isar.writeTxn(() async {
      await _isar.historyEntrys.put(entry);
    });
  }

  @override
  Future<void> deleteEntry(int id) async {
    await _isar.writeTxn(() async {
      await _isar.historyEntrys.delete(id);
    });
  }

  @override
  Future<void> clearHistory() async {
    await _isar.writeTxn(() async {
      await _isar.historyEntrys.clear();
    });
  }
}
