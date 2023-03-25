import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
@injectableInit
void configureInjection() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  getIt
    ..registerFactory(() => Client())
    ..registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}
