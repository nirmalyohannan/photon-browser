// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:isar_community/isar.dart' as _i214;
import 'package:uuid/uuid.dart' as _i706;

import '../../features/browser/data/repositories/browser_repository_impl.dart'
    as _i813;
import '../../features/browser/domain/repositories/browser_repository.dart'
    as _i914;
import '../../features/browser/domain/usecases/close_tab_usecase.dart' as _i284;
import '../../features/browser/domain/usecases/create_tab_usecase.dart'
    as _i793;
import '../../features/browser/domain/usecases/load_url_usecase.dart' as _i647;
import '../../features/browser/presentation/bloc/browser_bloc.dart' as _i322;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i214.Isar>(
      () => registerModule.isar,
      preResolve: true,
    );
    gh.lazySingleton<_i706.Uuid>(() => registerModule.uuid);
    gh.lazySingleton<_i647.LoadUrlUseCase>(() => _i647.LoadUrlUseCase());
    gh.lazySingleton<_i284.CloseTabUseCase>(() => _i284.CloseTabUseCase());
    gh.lazySingleton<_i793.CreateTabUseCase>(
      () => _i793.CreateTabUseCase(gh<_i706.Uuid>()),
    );
    gh.lazySingleton<_i914.BrowserRepository>(
      () => _i813.BrowserRepositoryImpl(gh<_i214.Isar>()),
    );
    gh.factory<_i322.BrowserBloc>(
      () => _i322.BrowserBloc(
        gh<_i793.CreateTabUseCase>(),
        gh<_i647.LoadUrlUseCase>(),
        gh<_i284.CloseTabUseCase>(),
        gh<_i914.BrowserRepository>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
