import 'package:isar_community/isar.dart';

part 'history_entry.g.dart';

@collection
class HistoryEntry {
  Id id = Isar.autoIncrement;

  late String url;

  late String title;

  late DateTime timestamp;
}
