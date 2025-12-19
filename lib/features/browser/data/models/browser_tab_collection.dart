import 'dart:typed_data';
import 'package:isar_community/isar.dart';
import '../../domain/entities/browser_tab.dart';

part 'browser_tab_collection.g.dart';

@collection
class BrowserTabCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String tabId;

  late String url;
  late String title;
  late bool isIncognito;
  late double scrollPosition;

  // Isar doesn't support storing Uint8List directly as a blob efficiently in the main object
  // if it's very large, but for thumbnails it's okay.
  // Isar supports List<int>.
  String? screenshotPath;

  List<int>? favicon;

  /// Map from Domain to Isar Collection
  static BrowserTabCollection fromDomain(BrowserTab tab) {
    return BrowserTabCollection()
      ..tabId = tab.id
      ..url = tab.url
      ..title = tab.title
      ..isIncognito = tab.isIncognito
      ..scrollPosition = tab.scrollPosition
      ..screenshotPath = tab.screenshotPath
      ..favicon = tab.favicon?.toList();
  }

  /// Map from Isar Collection to Domain
  BrowserTab toDomain() {
    return BrowserTab(
      id: tabId,
      url: url,
      title: title,
      isIncognito: isIncognito,
      scrollPosition: scrollPosition,
      // isLoading isn't persisted
      isLoading: false,
      screenshotPath: screenshotPath,
      favicon: favicon != null ? Uint8List.fromList(favicon!) : null,
    );
  }
}
