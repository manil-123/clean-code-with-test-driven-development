// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecom_clean_code/core/data/base_remote_data_source.dart' as _i6;
import 'package:ecom_clean_code/core/data/error_handler.dart' as _i4;
import 'package:ecom_clean_code/features/login/data/datasource/login_remote_data_source.dart'
    as _i7;
import 'package:ecom_clean_code/features/login/data/repository/login_repository_impl.dart'
    as _i9;
import 'package:ecom_clean_code/features/login/domain/repository/login_repository.dart'
    as _i8;
import 'package:ecom_clean_code/features/login/domain/usecase/login_user.dart'
    as _i10;
import 'package:ecom_clean_code/features/login/presentation/blocs/login_cubit.dart'
    as _i11;
import 'package:ecom_clean_code/injection.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.Client>(() => registerModule.httpClient);
    gh.lazySingleton<_i4.ErrorHandler>(() => _i4.ErrorHandler());
    gh.lazySingletonAsync<_i5.SharedPreferences>(
        () => registerModule.sharedPreferences);
    gh.lazySingletonAsync<_i6.BaseRemoteDataSource>(
        () async => _i6.BaseRemoteDataSourceImpl(
              gh<_i3.Client>(),
              await getAsync<_i5.SharedPreferences>(),
            ));
    gh.lazySingletonAsync<_i7.LoginRemoteDataSource>(
        () async => _i7.LoginUserRemoteDataSourceImpl(
              gh<_i3.Client>(),
              await getAsync<_i5.SharedPreferences>(),
            ));
    gh.lazySingletonAsync<_i8.LoginRepository>(() async =>
        _i9.LoginRepositoryImpl(
          errorHandler: gh<_i4.ErrorHandler>(),
          loginRemoteDataSource: await getAsync<_i7.LoginRemoteDataSource>(),
        ));
    gh.lazySingletonAsync<_i10.LoginUser>(
        () async => _i10.LoginUser(await getAsync<_i8.LoginRepository>()));
    gh.factoryAsync<_i11.LoginCubit>(() async => _i11.LoginCubit(
          await getAsync<_i10.LoginUser>(),
          await getAsync<_i5.SharedPreferences>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i12.RegisterModule {}
