// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecom_clean_code/core/data/base_remote_data_source.dart' as _i3;
import 'package:ecom_clean_code/core/data/error_handler.dart' as _i7;
import 'package:ecom_clean_code/features/categories/data/datasource/category_remote_data_source.dart'
    as _i6;
import 'package:ecom_clean_code/features/categories/data/repository/category_repository_impl.dart'
    as _i16;
import 'package:ecom_clean_code/features/categories/domain/repository/category_repository.dart'
    as _i15;
import 'package:ecom_clean_code/features/categories/domain/usecase/get_categories.dart'
    as _i17;
import 'package:ecom_clean_code/features/categories/presentation/cubit/category_cubit.dart'
    as _i22;
import 'package:ecom_clean_code/features/home/data/datasource/product_remote_data_source.dart'
    as _i12;
import 'package:ecom_clean_code/features/home/data/repository/product_repository_impl.dart'
    as _i21;
import 'package:ecom_clean_code/features/home/domain/repository/product_repository.dart'
    as _i20;
import 'package:ecom_clean_code/features/home/domain/usecase/get_products.dart'
    as _i23;
import 'package:ecom_clean_code/features/home/presentation/cubit/product_cubit_cubit.dart'
    as _i24;
import 'package:ecom_clean_code/features/login/data/datasource/login_remote_data_source.dart'
    as _i8;
import 'package:ecom_clean_code/features/login/data/repository/login_repository_impl.dart'
    as _i10;
import 'package:ecom_clean_code/features/login/domain/repository/login_repository.dart'
    as _i9;
import 'package:ecom_clean_code/features/login/domain/usecase/login_user.dart'
    as _i11;
import 'package:ecom_clean_code/features/login/presentation/blocs/login_cubit.dart'
    as _i19;
import 'package:ecom_clean_code/features/profile/data/repository/profile_repository_impl.dart'
    as _i14;
import 'package:ecom_clean_code/features/profile/domain/repository/profile_repository.dart'
    as _i13;
import 'package:ecom_clean_code/features/profile/domain/usecase/get_profile.dart'
    as _i18;
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
    gh.lazySingleton<_i6.CategoryRemoteDataSource>(
        () => _i6.CategoryRemoteDataSource(
              gh<_i4.Client>(),
              gh<_i5.SharedPreferences>(),
            ));
    gh.lazySingleton<_i7.ErrorHandler>(() => _i7.ErrorHandler());
    gh.lazySingleton<_i8.LoginRemoteDataSource>(
        () => _i8.LoginUserRemoteDataSourceImpl(
              gh<_i4.Client>(),
              gh<_i5.SharedPreferences>(),
            ));
    gh.lazySingleton<_i9.LoginRepository>(() => _i10.LoginRepositoryImpl(
          errorHandler: gh<_i7.ErrorHandler>(),
          loginRemoteDataSource: gh<_i8.LoginRemoteDataSource>(),
        ));
    gh.lazySingleton<_i11.LoginUser>(
        () => _i11.LoginUser(gh<_i9.LoginRepository>()));
    gh.lazySingleton<_i12.ProductsRemoteDataSource>(
        () => _i12.ProductsRemoteDataSource(
              gh<_i4.Client>(),
              gh<_i5.SharedPreferences>(),
            ));
    gh.lazySingleton<_i13.ProfileRepository>(
        () => _i14.ProfileRepositoryImpl());
    gh.lazySingleton<_i15.CategoryRepository>(() => _i16.CategoryRepositoryImpl(
          gh<_i7.ErrorHandler>(),
          gh<_i6.CategoryRemoteDataSource>(),
        ));
    gh.lazySingleton<_i17.GetCategories>(
        () => _i17.GetCategories(gh<_i15.CategoryRepository>()));
    gh.lazySingleton<_i18.GetProfile>(
        () => _i18.GetProfile(gh<_i13.ProfileRepository>()));
    gh.factory<_i19.LoginCubit>(() => _i19.LoginCubit(
          gh<_i11.LoginUser>(),
          gh<_i5.SharedPreferences>(),
        ));
    gh.lazySingleton<_i20.ProductRepository>(
        () => _i21.ProductRepositoryImpl(gh<_i12.ProductsRemoteDataSource>()));
    gh.factory<_i22.CategoryCubit>(
        () => _i22.CategoryCubit(gh<_i17.GetCategories>()));
    gh.lazySingleton<_i23.GetProducts>(() =>
        _i23.GetProducts(productRepository: gh<_i20.ProductRepository>()));
    gh.factory<_i24.ProductCubit>(
        () => _i24.ProductCubit(gh<_i23.GetProducts>()));
    return this;
  }
}
