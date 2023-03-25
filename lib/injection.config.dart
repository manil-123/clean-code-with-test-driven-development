// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecom_clean_code/core/data/base_remote_data_source.dart' as _i3;
import 'package:ecom_clean_code/core/data/error_handler.dart' as _i6;
import 'package:ecom_clean_code/features/login/data/datasource/login_remote_data_source.dart'
    as _i7;
import 'package:ecom_clean_code/features/login/data/repository/login_repository_impl.dart'
    as _i9;
import 'package:ecom_clean_code/features/login/domain/repository/login_repository.dart'
    as _i8;
import 'package:ecom_clean_code/features/login/domain/usecase/login_user.dart'
    as _i10;
import 'package:ecom_clean_code/features/login/presentation/blocs/login_cubit.dart'
    as _i14;
import 'package:ecom_clean_code/features/profile/data/repository/profile_repository_impl.dart'
    as _i12;
import 'package:ecom_clean_code/features/profile/domain/repository/profile_repository.dart'
    as _i11;
import 'package:ecom_clean_code/features/profile/domain/usecase/get_profile.dart'
    as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i4;
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
    gh.lazySingleton<_i3.BaseRemoteDataSource>(
        () => _i3.BaseRemoteDataSourceImpl(
              gh<_i4.Client>(),
              gh<_i5.SharedPreferences>(),
            ));
    gh.lazySingleton<_i6.ErrorHandler>(() => _i6.ErrorHandler());
    gh.lazySingleton<_i7.LoginRemoteDataSource>(
        () => _i7.LoginUserRemoteDataSourceImpl(
              gh<_i4.Client>(),
              gh<_i5.SharedPreferences>(),
            ));
    gh.lazySingleton<_i8.LoginRepository>(() => _i9.LoginRepositoryImpl(
          errorHandler: gh<_i6.ErrorHandler>(),
          loginRemoteDataSource: gh<_i7.LoginRemoteDataSource>(),
        ));
    gh.lazySingleton<_i10.LoginUser>(
        () => _i10.LoginUser(gh<_i8.LoginRepository>()));
    gh.lazySingleton<_i11.ProfileRepository>(
        () => _i12.ProfileRepositoryImpl());
    gh.lazySingleton<_i13.GetProfile>(
        () => _i13.GetProfile(gh<_i11.ProfileRepository>()));
    gh.factory<_i14.LoginCubit>(() => _i14.LoginCubit(
          gh<_i10.LoginUser>(),
          gh<_i5.SharedPreferences>(),
        ));
    return this;
  }
}
