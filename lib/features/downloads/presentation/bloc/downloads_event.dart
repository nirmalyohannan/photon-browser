import 'package:equatable/equatable.dart';
import '../../domain/entities/download_item.dart';

abstract class DownloadsEvent extends Equatable {
  const DownloadsEvent();

  @override
  List<Object?> get props => [];
}

class LoadDownloads extends DownloadsEvent {
  const LoadDownloads();
}

class DownloadsUpdated extends DownloadsEvent {
  final List<DownloadItem> downloads;
  const DownloadsUpdated(this.downloads);
  @override
  List<Object?> get props => [downloads];
}

class StartDownload extends DownloadsEvent {
  final String url;
  final String filename;
  const StartDownload({required this.url, required this.filename});
  @override
  List<Object?> get props => [url, filename];
}

class PauseDownload extends DownloadsEvent {
  final String id;
  const PauseDownload(this.id);
  @override
  List<Object?> get props => [id];
}

class ResumeDownload extends DownloadsEvent {
  final String id;
  const ResumeDownload(this.id);
  @override
  List<Object?> get props => [id];
}

class CancelDownload extends DownloadsEvent {
  final String id;
  const CancelDownload(this.id);
  @override
  List<Object?> get props => [id];
}

class RetryDownload extends DownloadsEvent {
  final String id;
  const RetryDownload(this.id);
  @override
  List<Object?> get props => [id];
}

class DeleteDownload extends DownloadsEvent {
  final String id;
  final bool deleteFile;
  const DeleteDownload(this.id, {this.deleteFile = false});
  @override
  List<Object?> get props => [id, deleteFile];
}

class ClearCompletedDownloads extends DownloadsEvent {
  const ClearCompletedDownloads();
}
