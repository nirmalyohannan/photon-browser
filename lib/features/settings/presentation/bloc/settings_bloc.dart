import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/settings_repository.dart';

// Events
abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
  @override
  List<Object?> get props => [];
}

class LoadSettings extends SettingsEvent {}

class ChangeSearchEngine extends SettingsEvent {
  final String url;
  const ChangeSearchEngine(this.url);
  @override
  List<Object?> get props => [url];
}

// States
abstract class SettingsState extends Equatable {
  const SettingsState();
  @override
  List<Object?> get props => [];
}

class SettingsInitial extends SettingsState {}

class SettingsLoaded extends SettingsState {
  final String searchEngineUrl;
  const SettingsLoaded({required this.searchEngineUrl});
  @override
  List<Object?> get props => [searchEngineUrl];
}

// Bloc
@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository _repository;

  SettingsBloc(this._repository) : super(SettingsInitial()) {
    on<LoadSettings>((event, emit) async {
      final url = await _repository.getSearchEngineUrl();
      emit(SettingsLoaded(searchEngineUrl: url));
    });

    on<ChangeSearchEngine>((event, emit) async {
      await _repository.setSearchEngineUrl(event.url);
      add(LoadSettings());
    });
  }
}
