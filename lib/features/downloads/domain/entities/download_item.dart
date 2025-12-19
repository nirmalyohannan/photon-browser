class DownloadItem {
  final String id;
  final String url;
  final String filename;
  final String path;
  final double progress; // 0.0 to 1.0
  final DownloadStatus status;
  final DateTime createdAt;
  final int totalBytes;
  final int receivedBytes;

  const DownloadItem({
    required this.id,
    required this.url,
    required this.filename,
    required this.path,
    required this.progress,
    required this.status,
    required this.createdAt,
    this.totalBytes = 0,
    this.receivedBytes = 0,
  });

  DownloadItem copyWith({
    String? id,
    String? url,
    String? filename,
    String? path,
    double? progress,
    DownloadStatus? status,
    DateTime? createdAt,
    int? totalBytes,
    int? receivedBytes,
  }) {
    return DownloadItem(
      id: id ?? this.id,
      url: url ?? this.url,
      filename: filename ?? this.filename,
      path: path ?? this.path,
      progress: progress ?? this.progress,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      totalBytes: totalBytes ?? this.totalBytes,
      receivedBytes: receivedBytes ?? this.receivedBytes,
    );
  }
}

enum DownloadStatus { pending, running, paused, completed, failed, canceled }
