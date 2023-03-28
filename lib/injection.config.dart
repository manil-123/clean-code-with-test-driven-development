// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecom_clean_code/core/data/base_remote_data_source.dart' as _i6;
import 'package:ecom_clean_code/core/data/error_handler.dart' as _i4;
import 'package:ecom_clean_code/features/categories/data/datasource/category_remote_data_source.dart'
    as _i7;
import 'package:ecom_clean_code/features/categories/data/repository/category_repository_impl.dart'
    as _i9;
import 'package:ecom_clean_code/features/categories/domain/repository/category_repository.dart'
    as _i8;
import 'package:ecom_clean_code/features/categories/domain/usecase/get_categories.dart'
    as _i10;
import 'package:ecom_clean_code/features/categories/presentation/cubit/category_cubit.dart'
    as _i16;
import 'package:ecom_clean_code/features/home/data/datasource/product_remote_data_source.dart'
    as _i15;
import 'package:ecom_clean_code/features/home/data/repository/product_repository_impl.dart'
    as _i18;
import 'package:ecom_clean_code/features/home/domain/repository/product_repository.dart'
    as _i17;
import 'package:ecom_clean_code/features/home/domain/usecase/get_products.dart'
    as _i19;
import 'package:ecom_clean_code/features/home/presentation/cubit/product_cubit_cubit.dart'
    as _i20;
import 'package:ecom_clean_code/features/login/data/datasource/login_remote_data_source.dart'
    as _i11;
import 'package:ecom_clean_code/features/login/data/repository/login_repository_impl.dart'
    as _i13;
import 'package:ecom_clean_code/features/login/domain/repository/login_repository.dart'
    as _i12;
import 'package:ecom_clean_code/features/login/domain/usecase/login_user.dart'
    as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

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
    await gh.lazySingletonAsync<_i5.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i6.BaseRemoteDataSource>(
        () => _i6.BaseRemoteDataSourceImpl(
              gh<_i3.Client>(),
              gh<_i5.SharedPreferences>(),
            ));
    gh.lazySingleton<_i7.CategoryRemoteDataSource>(
        () => _i7.CategoryRemoteDataSource(
              gh<_i3.Client>(),
              gh<_i5.SharedPreferences>(),
            ));
    gh.lazySingleton<_i8.CategoryRepository>(() => _i9.CategoryRepositoryImpl(
          gh<_i4.ErrorHandler>(),
          gh<_i7.CategoryRemoteDataSource>(),
        ));
    gh.lazySingleton<_i10.GetCategories>(
        () => _i10.GetCategories(gh<_i8.CategoryRepository>()));
    gh.lazySingleton<_i11.LoginRemoteDataSource>(
        () => _i11.LoginUserRemoteDataSourceImpl(
              gh<_i3.Client>(),
              gh<_i5.SharedPreferences>(),
            ));
    gh.lazySingleton<_i12.LoginRepository>(() => _i13.LoginRepositoryImpl(
          errorHandler: gh<_i4.ErrorHandler>(),
          loginRemoteDataSource: gh<_i11.LoginRemoteDataSource>(),
        ));
    gh.lazySingleton<_i14.LoginUser>(
        () => _i14.LoginUser(gh<_i12.LoginRepository>()));
    gh.lazySingleton<_i15.ProductsRemoteDataSource>(
        () => _i15.ProductsRemoteDataSource(
              gh<_i3.Client>(),
              gh<_i5.SharedPreferences>(),
            ));
    gh.factory<_i16.CategoryCubit>(
        () => _i16.CategoryCubit(gh<_i10.GetCategories>()));
    gh.lazySingleton<_i17.ProductRepository>(
        () => _i18.ProductRepositoryImpl(gh<_i15.ProductsRemoteDataSource>()));
    gh.lazySingleton<_i19.GetProducts>(() =>
        _i19.GetProducts(productRepository: gh<_i17.ProductRepository>()));
    gh.factory<_i20.ProductCubit>(
        () => _i20.ProductCubit(gh<_i19.GetProducts>()));
    return this;
  }
}

class _$RegisterModule extends _i6.RegisterModule {}
