import 'package:equatable/equatable.dart';
import '../../domain/entities/download_item.dart';

enum DownloadsStatus { initial, loading, loaded, failure }

class DownloadsState extends Equatable {
  final DownloadsStatus status;
  final List<DownloadItem> downloads;
  final String? errorMessage;

  const DownloadsState({
    this.status = DownloadsStatus.initial,
    this.downloads = const [],
    this.errorMessage,
  });

  DownloadsState copyWith({
    DownloadsStatus? status,
    List<DownloadItem>? downloads,
    String? errorMessage,
  }) {
    return DownloadsState(
      status: status ?? this.status,
      downloads: downloads ?? this.downloads,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, downloads, errorMessage];
}
