// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecom_clean_code/app/database/cart_dao.dart' as _i3;
import 'package:ecom_clean_code/app/database/profile_dao.dart' as _i12;
import 'package:ecom_clean_code/core/data/base_remote_data_source.dart' as _i18;
import 'package:ecom_clean_code/core/data/error_handler.dart' as _i9;
import 'package:ecom_clean_code/features/cart/data/datasource/cart_local_source.dart'
    as _i4;
import 'package:ecom_clean_code/features/cart/data/repository/cart_repository_impl.dart'
    as _i6;
import 'package:ecom_clean_code/features/cart/domain/repository/cart_repository.dart'
    as _i5;
import 'package:ecom_clean_code/features/cart/domain/usecase/add_to_cart.dart'
    as _i16;
import 'package:ecom_clean_code/features/cart/domain/usecase/check_in_cart.dart'
    as _i7;
import 'package:ecom_clean_code/features/cart/domain/usecase/get_cart_list.dart'
    as _i10;
import 'package:ecom_clean_code/features/cart/presentation/cubit/add_to_cart_cubit.dart'
    as _i17;
import 'package:ecom_clean_code/features/cart/presentation/cubit/check_cart_cubit.dart'
    as _i22;
import 'package:ecom_clean_code/features/cart/presentation/cubit/get_cart_cubit.dart'
    as _i23;
import 'package:ecom_clean_code/features/categories/data/datasource/category_remote_data_source.dart'
    as _i19;
import 'package:ecom_clean_code/features/categories/data/repository/category_repository_impl.dart'
    as _i21;
import 'package:ecom_clean_code/features/categories/domain/repository/category_repository.dart'
    as _i20;
import 'package:ecom_clean_code/features/categories/domain/usecase/get_categories.dart'
    as _i24;
import 'package:ecom_clean_code/features/categories/presentation/cubit/category_cubit.dart'
    as _i33;
import 'package:ecom_clean_code/features/home/data/datasource/product_remote_data_source.dart'
    as _i29;
import 'package:ecom_clean_code/features/home/data/mapper/product_domain_mapper.dart'
    as _i11;
import 'package:ecom_clean_code/features/home/data/repository/product_repository_impl.dart'
    as _i37;
import 'package:ecom_clean_code/features/home/domain/repository/product_repository.dart'
    as _i36;
import 'package:ecom_clean_code/features/home/domain/usecase/get_products.dart'
    as _i39;
import 'package:ecom_clean_code/features/home/presentation/cubit/product_cubit_cubit.dart'
    as _i40;
import 'package:ecom_clean_code/features/login/data/datasource/login_remote_data_source.dart'
    as _i25;
import 'package:ecom_clean_code/features/login/data/repository/login_repository_impl.dart'
    as _i27;
import 'package:ecom_clean_code/features/login/domain/repository/login_repository.dart'
    as _i26;
import 'package:ecom_clean_code/features/login/domain/usecase/login_user.dart'
    as _i28;
import 'package:ecom_clean_code/features/login/presentation/blocs/login_cubit.dart'
    as _i35;
import 'package:ecom_clean_code/features/profile/data/datasource/profile_local_data_source.dart'
    as _i14;
import 'package:ecom_clean_code/features/profile/data/datasource/profile_remote_data_source.dart'
    as _i30;
import 'package:ecom_clean_code/features/profile/data/mapper/profile_domain_mapper.dart'
    as _i13;
import 'package:ecom_clean_code/features/profile/data/repository/profile_repository_impl.dart'
    as _i32;
import 'package:ecom_clean_code/features/profile/domain/repository/profile_repository.dart'
    as _i31;
import 'package:ecom_clean_code/features/profile/domain/usecase/get_profile.dart'
    as _i34;
import 'package:ecom_clean_code/features/profile/presentation/cubit/profile_cubit.dart'
    as _i38;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i8;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart'
    as _i15; // ignore_for_file: unnecessary_lambdas

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
    gh.lazySingleton<_i3.CartDao>(() => _i3.CartDao());
    gh.lazySingleton<_i4.CartLocalSource>(
        () => _i4.CartLocalSource(gh<_i3.CartDao>()));
    gh.lazySingleton<_i5.CartRepository>(
        () => _i6.CartRepositoryImpl(gh<_i4.CartLocalSource>()));
    gh.lazySingleton<_i7.CheckInCart>(
        () => _i7.CheckInCart(gh<_i5.CartRepository>()));
    gh.lazySingleton<_i8.Client>(() => registerModule.httpClient);
    gh.lazySingleton<_i9.ErrorHandler>(() => _i9.ErrorHandler());
    gh.lazySingleton<_i10.GetCartList>(
        () => _i10.GetCartList(gh<_i5.CartRepository>()));
    gh.lazySingleton<_i11.ProductDomainMapper>(
        () => _i11.ProductDomainMapperImpl());
    gh.lazySingleton<_i12.ProfileDao>(() => _i12.ProfileDao());
    gh.lazySingleton<_i13.ProfileDomainMapper>(
        () => _i13.ProfileDomainMapperImpl());
    gh.lazySingleton<_i14.ProfileLocalDataSource>(
        () => _i14.ProfileLocalDataSource(gh<_i12.ProfileDao>()));
    await gh.lazySingletonAsync<_i15.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i16.AddToCart>(
        () => _i16.AddToCart(gh<_i5.CartRepository>()));
    gh.factory<_i17.AddToCartCubit>(
        () => _i17.AddToCartCubit(gh<_i16.AddToCart>()));
    gh.lazySingleton<_i18.BaseRemoteDataSource>(
        () => _i18.BaseRemoteDataSourceImpl(
              gh<_i8.Client>(),
              gh<_i15.SharedPreferences>(),
            ));
    gh.lazySingleton<_i19.CategoryRemoteDataSource>(
        () => _i19.CategoryRemoteDataSource(
              gh<_i8.Client>(),
              gh<_i15.SharedPreferences>(),
            ));
    gh.lazySingleton<_i20.CategoryRepository>(() => _i21.CategoryRepositoryImpl(
          gh<_i9.ErrorHandler>(),
          gh<_i19.CategoryRemoteDataSource>(),
        ));
    gh.factory<_i22.CheckCartCubit>(
        () => _i22.CheckCartCubit(gh<_i7.CheckInCart>()));
    gh.factory<_i23.GetCartCubit>(
        () => _i23.GetCartCubit(gh<_i10.GetCartList>()));
    gh.lazySingleton<_i24.GetCategories>(
        () => _i24.GetCategories(gh<_i20.CategoryRepository>()));
    gh.lazySingleton<_i25.LoginRemoteDataSource>(
        () => _i25.LoginUserRemoteDataSourceImpl(
              gh<_i8.Client>(),
              gh<_i15.SharedPreferences>(),
            ));
    gh.lazySingleton<_i26.LoginRepository>(() => _i27.LoginRepositoryImpl(
          errorHandler: gh<_i9.ErrorHandler>(),
          loginRemoteDataSource: gh<_i25.LoginRemoteDataSource>(),
        ));
    gh.lazySingleton<_i28.LoginUser>(
        () => _i28.LoginUser(gh<_i26.LoginRepository>()));
    gh.lazySingleton<_i29.ProductsRemoteDataSource>(
        () => _i29.ProductsRemoteDataSource(
              gh<_i8.Client>(),
              gh<_i15.SharedPreferences>(),
            ));
    gh.lazySingleton<_i30.ProfileRemoteDataSource>(
        () => _i30.ProfileRemoteDataSource(
              gh<_i8.Client>(),
              gh<_i15.SharedPreferences>(),
              gh<_i12.ProfileDao>(),
            ));
    gh.lazySingleton<_i31.ProfileRepository>(() => _i32.ProfileRepositoryImpl(
          gh<_i30.ProfileRemoteDataSource>(),
          gh<_i14.ProfileLocalDataSource>(),
          gh<_i13.ProfileDomainMapper>(),
          gh<_i9.ErrorHandler>(),
        ));
    gh.factory<_i33.CategoryCubit>(
        () => _i33.CategoryCubit(gh<_i24.GetCategories>()));
    gh.lazySingleton<_i34.GetProfile>(
        () => _i34.GetProfile(gh<_i31.ProfileRepository>()));
    gh.factory<_i35.LoginCubit>(() => _i35.LoginCubit(
          gh<_i28.LoginUser>(),
          gh<_i15.SharedPreferences>(),
        ));
    gh.lazySingleton<_i36.ProductRepository>(() => _i37.ProductRepositoryImpl(
          gh<_i29.ProductsRemoteDataSource>(),
          gh<_i9.ErrorHandler>(),
          gh<_i11.ProductDomainMapper>(),
        ));
    gh.factory<_i38.ProfileCubit>(
        () => _i38.ProfileCubit(gh<_i34.GetProfile>()));
    gh.lazySingleton<_i39.GetProducts>(() =>
        _i39.GetProducts(productRepository: gh<_i36.ProductRepository>()));
    gh.factory<_i40.ProductCubit>(
        () => _i40.ProductCubit(gh<_i39.GetProducts>()));
    return this;
  }
}

class _$RegisterModule extends _i18.RegisterModule {}
