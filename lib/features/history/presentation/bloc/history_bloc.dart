import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/history_repository.dart';
import '../../data/models/history_entry.dart';

// Events
abstract class HistoryEvent extends Equatable {
  const HistoryEvent();
  @override
  List<Object?> get props => [];
}

class LoadHistory extends HistoryEvent {}

class AddHistoryEntry extends HistoryEvent {
  final String url;
  final String title;
  const AddHistoryEntry({required this.url, required this.title});
  @override
  List<Object?> get props => [url, title];
}

class DeleteHistoryEntry extends HistoryEvent {
  final int id;
  const DeleteHistoryEntry(this.id);
  @override
  List<Object?> get props => [id];
}

class ClearHistory extends HistoryEvent {}

// States
abstract class HistoryState extends Equatable {
  const HistoryState();
  @override
  List<Object?> get props => [];
}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistoryLoaded extends HistoryState {
  final List<HistoryEntry> history;
  const HistoryLoaded(this.history);
  @override
  List<Object?> get props => [history];
}

class HistoryError extends HistoryState {
  final String message;
  const HistoryError(this.message);
  @override
  List<Object?> get props => [message];
}

// Bloc
@injectable
class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final HistoryRepository _repository;

  HistoryBloc(this._repository) : super(HistoryInitial()) {
    on<LoadHistory>((event, emit) async {
      emit(HistoryLoading());
      try {
        final history = await _repository.getHistory();
        emit(HistoryLoaded(history));
      } catch (e) {
        emit(HistoryError(e.toString()));
      }
    });

    on<AddHistoryEntry>((event, emit) async {
      await _repository.addEntry(event.url, event.title);
      // Reload history after adding
      add(LoadHistory());
    });

    on<DeleteHistoryEntry>((event, emit) async {
      await _repository.deleteEntry(event.id);
      add(LoadHistory());
    });

    on<ClearHistory>((event, emit) async {
      await _repository.clearHistory();
      add(LoadHistory());
    });
  }
}
