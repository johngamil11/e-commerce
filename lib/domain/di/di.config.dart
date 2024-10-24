// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/api_manager.dart' as _i236;
import '../../data/data_sources/remote_data-source/auth_remote_data_source.dart'
    as _i728;
import '../../data/data_sources/remote_data-source/auth_remote_data_source_imp.dart'
    as _i270;
import '../../data/repository/authRepositoryImp.dart' as _i295;
import '../../feature/auth/login/cubit/login_view_model.dart' as _i473;
import '../../feature/auth/register/cubit/register_view_model.dart' as _i139;
import '../repository/auth_repository.dart' as _i106;
import '../use_cases/login_use_case.dart' as _i119;
import '../use_cases/register_use_case.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i236.ApiManager>(() => _i236.ApiManager());
    gh.factory<_i728.AuthRemoteDataSource>(() =>
        _i270.AuthRemoteDataSourceImp(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i106.AuthRepository>(() => _i295.Authrepositoryimp(
        authRemoteDataSource: gh<_i728.AuthRemoteDataSource>()));
    gh.factory<_i526.RegisterUseCase>(() =>
        _i526.RegisterUseCase(authRepository: gh<_i106.AuthRepository>()));
    gh.factory<_i119.LoginUseCase>(
        () => _i119.LoginUseCase(authRepository: gh<_i106.AuthRepository>()));
    gh.factory<_i139.RegisterViewModel>(() =>
        _i139.RegisterViewModel(registerUseCase: gh<_i526.RegisterUseCase>()));
    gh.factory<_i473.LoginViewModel>(
        () => _i473.LoginViewModel(loginUseCase: gh<_i119.LoginUseCase>()));
    return this;
  }
}
