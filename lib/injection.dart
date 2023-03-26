import 'package:ecom_clean_code/core/data/error_handler.dart';
import 'package:ecom_clean_code/features/login/data/datasource/login_remote_data_source.dart';
import 'package:ecom_clean_code/features/login/data/repository/login_repository_impl.dart';
import 'package:ecom_clean_code/features/login/domain/repository/login_repository.dart';
import 'package:ecom_clean_code/features/login/domain/usecase/login_user.dart';
import 'package:ecom_clean_code/features/login/presentation/blocs/login_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;
@injectableInit
Future<void> configureInjection() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  getIt
    ..registerFactory(() => Client())
    ..registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  // ..registerLazySingleton(() => ErrorHandler())
  // ..registerLazySingleton<LoginRemoteDataSource>(
  //   () => LoginUserRemoteDataSourceImpl(
  //     getIt(),
  //     getIt(),
  //   ),
  // )
  // ..registerLazySingleton<LoginRepository>(
  //   () => LoginRepositoryImpl(
  //     errorHandler: getIt(),
  //     loginRemoteDataSource: getIt(),
  //   ),
  // )
  // ..registerLazySingleton(
  //   () => LoginUser(
  //     getIt(),
  //   ),
  // )
  // ..registerFactory(
  //   () => LoginCubit(
  //     getIt(),
  //     getIt(),
  //   ),
  // );
}

@module
abstract class RegisterModule {
  @lazySingleton
  http.Client get httpClient => http.Client();

  @lazySingleton
  Future<SharedPreferences> get sharedPreferences async =>
      await SharedPreferences.getInstance();
}
