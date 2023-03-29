// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecom_clean_code/app/database/profile_dao.dart' as _i5;
import 'package:ecom_clean_code/core/data/base_remote_data_source.dart' as _i9;
import 'package:ecom_clean_code/core/data/error_handler.dart' as _i4;
import 'package:ecom_clean_code/features/categories/data/datasource/category_remote_data_source.dart'
    as _i10;
import 'package:ecom_clean_code/features/categories/data/repository/category_repository_impl.dart'
    as _i12;
import 'package:ecom_clean_code/features/categories/domain/repository/category_repository.dart'
    as _i11;
import 'package:ecom_clean_code/features/categories/domain/usecase/get_categories.dart'
    as _i13;
import 'package:ecom_clean_code/features/categories/presentation/cubit/category_cubit.dart'
    as _i22;
import 'package:ecom_clean_code/features/home/data/datasource/product_remote_data_source.dart'
    as _i18;
import 'package:ecom_clean_code/features/home/data/repository/product_repository_impl.dart'
    as _i26;
import 'package:ecom_clean_code/features/home/domain/repository/product_repository.dart'
    as _i25;
import 'package:ecom_clean_code/features/home/domain/usecase/get_products.dart'
    as _i28;
import 'package:ecom_clean_code/features/home/presentation/cubit/product_cubit_cubit.dart'
    as _i29;
import 'package:ecom_clean_code/features/login/data/datasource/login_remote_data_source.dart'
    as _i14;
import 'package:ecom_clean_code/features/login/data/repository/login_repository_impl.dart'
    as _i16;
import 'package:ecom_clean_code/features/login/domain/repository/login_repository.dart'
    as _i15;
import 'package:ecom_clean_code/features/login/domain/usecase/login_user.dart'
    as _i17;
import 'package:ecom_clean_code/features/login/presentation/blocs/login_cubit.dart'
    as _i24;
import 'package:ecom_clean_code/features/profile/data/datasource/profile_local_data_source.dart'
    as _i7;
import 'package:ecom_clean_code/features/profile/data/datasource/profile_remote_data_source.dart'
    as _i19;
import 'package:ecom_clean_code/features/profile/data/mapper/profile_domain_mapper.dart'
    as _i6;
import 'package:ecom_clean_code/features/profile/data/repository/profile_repository_impl.dart'
    as _i21;
import 'package:ecom_clean_code/features/profile/domain/repository/profile_repository.dart'
    as _i20;
import 'package:ecom_clean_code/features/profile/domain/usecase/get_profile.dart'
    as _i23;
import 'package:ecom_clean_code/features/profile/presentation/cubit/profile_cubit.dart'
    as _i27;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.Client>(() => registerModule.httpClient);
    gh.lazySingleton<_i4.ErrorHandler>(() => _i4.ErrorHandler());
    gh.lazySingleton<_i5.ProfileDao>(() => _i5.ProfileDao());
    gh.lazySingleton<_i6.ProfileDomainMapper>(
        () => _i6.ProfileDomainMapperImpl());
    gh.lazySingleton<_i7.ProfileLocalDataSource>(
        () => _i7.ProfileLocalDataSource(gh<_i5.ProfileDao>()));
    await gh.lazySingletonAsync<_i8.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i9.BaseRemoteDataSource>(
        () => _i9.BaseRemoteDataSourceImpl(
              gh<_i3.Client>(),
              gh<_i8.SharedPreferences>(),
            ));
    gh.lazySingleton<_i10.CategoryRemoteDataSource>(
        () => _i10.CategoryRemoteDataSource(
              gh<_i3.Client>(),
              gh<_i8.SharedPreferences>(),
            ));
    gh.lazySingleton<_i11.CategoryRepository>(() => _i12.CategoryRepositoryImpl(
          gh<_i4.ErrorHandler>(),
          gh<_i10.CategoryRemoteDataSource>(),
        ));
    gh.lazySingleton<_i13.GetCategories>(
        () => _i13.GetCategories(gh<_i11.CategoryRepository>()));
    gh.lazySingleton<_i14.LoginRemoteDataSource>(
        () => _i14.LoginUserRemoteDataSourceImpl(
              gh<_i3.Client>(),
              gh<_i8.SharedPreferences>(),
            ));
    gh.lazySingleton<_i15.LoginRepository>(() => _i16.LoginRepositoryImpl(
          errorHandler: gh<_i4.ErrorHandler>(),
          loginRemoteDataSource: gh<_i14.LoginRemoteDataSource>(),
        ));
    gh.lazySingleton<_i17.LoginUser>(
        () => _i17.LoginUser(gh<_i15.LoginRepository>()));
    gh.lazySingleton<_i18.ProductsRemoteDataSource>(
        () => _i18.ProductsRemoteDataSource(
              gh<_i3.Client>(),
              gh<_i8.SharedPreferences>(),
            ));
    gh.lazySingleton<_i19.ProfileRemoteDataSource>(
        () => _i19.ProfileRemoteDataSource(
              gh<_i3.Client>(),
              gh<_i8.SharedPreferences>(),
              gh<_i5.ProfileDao>(),
            ));
    gh.lazySingleton<_i20.ProfileRepository>(() => _i21.ProfileRepositoryImpl(
          gh<_i19.ProfileRemoteDataSource>(),
          gh<_i7.ProfileLocalDataSource>(),
          gh<_i6.ProfileDomainMapper>(),
          gh<_i4.ErrorHandler>(),
        ));
    gh.factory<_i22.CategoryCubit>(
        () => _i22.CategoryCubit(gh<_i13.GetCategories>()));
    gh.lazySingleton<_i23.GetProfile>(
        () => _i23.GetProfile(gh<_i20.ProfileRepository>()));
    gh.factory<_i24.LoginCubit>(() => _i24.LoginCubit(
          gh<_i17.LoginUser>(),
          gh<_i8.SharedPreferences>(),
        ));
    gh.lazySingleton<_i25.ProductRepository>(
        () => _i26.ProductRepositoryImpl(gh<_i18.ProductsRemoteDataSource>()));
    gh.factory<_i27.ProfileCubit>(
        () => _i27.ProfileCubit(gh<_i23.GetProfile>()));
    gh.lazySingleton<_i28.GetProducts>(() =>
        _i28.GetProducts(productRepository: gh<_i25.ProductRepository>()));
    gh.factory<_i29.ProductCubit>(
        () => _i29.ProductCubit(gh<_i28.GetProducts>()));
    return this;
  }
}

class _$RegisterModule extends _i9.RegisterModule {}
