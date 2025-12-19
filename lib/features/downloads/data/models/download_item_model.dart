import 'package:isar_community/isar.dart';
import '../../domain/entities/download_item.dart';

part 'download_item_model.g.dart';

@collection
class DownloadItemModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String downloadId;

  late String url;
  late String filename;
  late String path;
  late double progress;

  @Enumerated(EnumType.name)
  late DownloadStatus status;

  late DateTime createdAt;
  late int totalBytes;
  late int receivedBytes;

  DownloadItem toEntity() {
    return DownloadItem(
      id: downloadId,
      url: url,
      filename: filename,
      path: path,
      progress: progress,
      status: status,
      createdAt: createdAt,
      totalBytes: totalBytes,
      receivedBytes: receivedBytes,
    );
  }

  static DownloadItemModel fromEntity(DownloadItem item) {
    return DownloadItemModel()
      ..downloadId = item.id
      ..url = item.url
      ..filename = item.filename
      ..path = item.path
      ..progress = item.progress
      ..status = item.status
      ..createdAt = item.createdAt
      ..totalBytes = item.totalBytes
      ..receivedBytes = item.receivedBytes;
  }
}
