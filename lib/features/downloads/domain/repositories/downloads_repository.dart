import '../entities/download_item.dart';

abstract class DownloadsRepository {
  /// Stream of all download items
  Stream<List<DownloadItem>> getDownloadsStream();

  /// Get download by ID
  Future<DownloadItem?> getDownload(String id);

  /// Start a new download
  Future<void> startDownload({required String url, required String filename});

  /// Pause a download
  Future<void> pauseDownload(String id);

  /// Resume a download
  Future<void> resumeDownload(String id);

  /// Cancel a download
  Future<void> cancelDownload(String id);

  /// Retry a failed download
  Future<void> retryDownload(String id);

  /// Delete a download (and optional file)
  Future<void> deleteDownload(String id, {bool deleteFile = false});

  /// Clear completed downloads
  Future<void> clearCompletedDownloads();
}
