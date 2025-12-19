import '../../data/models/history_entry.dart';

abstract class HistoryRepository {
  Future<List<HistoryEntry>> getHistory();
  Future<void> addEntry(String url, String title);
  Future<void> deleteEntry(int id);
  Future<void> clearHistory();
}
