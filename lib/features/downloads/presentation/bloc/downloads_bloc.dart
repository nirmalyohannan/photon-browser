import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/downloads_repository.dart';
import 'downloads_event.dart';
import 'downloads_state.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final DownloadsRepository _repository;
  StreamSubscription? _downloadsSubscription;

  DownloadsBloc(this._repository) : super(const DownloadsState()) {
    on<LoadDownloads>(_onLoadDownloads);
    on<DownloadsUpdated>(_onDownloadsUpdated);
    on<StartDownload>(_onStartDownload);
    on<PauseDownload>(_onPauseDownload);
    on<ResumeDownload>(_onResumeDownload);
    on<CancelDownload>(_onCancelDownload);
    on<RetryDownload>(_onRetryDownload);
    on<DeleteDownload>(_onDeleteDownload);
    on<ClearCompletedDownloads>(_onClearCompletedDownloads);
  }

  Future<void> _onLoadDownloads(
    LoadDownloads event,
    Emitter<DownloadsState> emit,
  ) async {
    emit(state.copyWith(status: DownloadsStatus.loading));

    await _downloadsSubscription?.cancel();
    _downloadsSubscription = _repository.getDownloadsStream().listen(
      (downloads) {
        add(DownloadsUpdated(downloads));
      },
      onError: (error) {
        // Handle error
      },
    );
  }

  void _onDownloadsUpdated(
    DownloadsUpdated event,
    Emitter<DownloadsState> emit,
  ) {
    emit(
      state.copyWith(
        status: DownloadsStatus.loaded,
        downloads: event.downloads,
      ),
    );
  }

  Future<void> _onStartDownload(
    StartDownload event,
    Emitter<DownloadsState> emit,
  ) async {
    try {
      await _repository.startDownload(url: event.url, filename: event.filename);
      // No state update needed, stream will handle it
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Failed to start download: $e'));
    }
  }

  Future<void> _onPauseDownload(
    PauseDownload event,
    Emitter<DownloadsState> emit,
  ) async {
    await _repository.pauseDownload(event.id);
  }

  Future<void> _onResumeDownload(
    ResumeDownload event,
    Emitter<DownloadsState> emit,
  ) async {
    await _repository.resumeDownload(event.id);
  }

  Future<void> _onCancelDownload(
    CancelDownload event,
    Emitter<DownloadsState> emit,
  ) async {
    await _repository.cancelDownload(event.id);
  }

  Future<void> _onRetryDownload(
    RetryDownload event,
    Emitter<DownloadsState> emit,
  ) async {
    await _repository.retryDownload(event.id);
  }

  Future<void> _onDeleteDownload(
    DeleteDownload event,
    Emitter<DownloadsState> emit,
  ) async {
    await _repository.deleteDownload(event.id, deleteFile: event.deleteFile);
  }

  Future<void> _onClearCompletedDownloads(
    ClearCompletedDownloads event,
    Emitter<DownloadsState> emit,
  ) async {
    await _repository.clearCompletedDownloads();
  }

  @override
  Future<void> close() {
    _downloadsSubscription?.cancel();
    return super.close();
  }
}
