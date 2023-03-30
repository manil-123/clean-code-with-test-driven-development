import 'package:device_preview/device_preview.dart';
import 'package:ecom_clean_code/app/router/app_router.dart';
import 'package:ecom_clean_code/app/theme/theme_data.dart';
import 'package:ecom_clean_code/core/constants/configs.dart';
import 'package:ecom_clean_code/features/home/data/model/product_data_model.dart';
import 'package:ecom_clean_code/features/home/presentation/cubit/product_cubit_cubit.dart';
import 'package:ecom_clean_code/features/profile/data/model/profile_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'features/categories/presentation/cubit/category_cubit.dart';
import 'features/login/presentation/blocs/login_cubit.dart';
import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  await initHive();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (_) => MyApp(),
    ),
  );
}

Future<void> initHive() async {
  final appDir = await getApplicationDocumentsDirectory();
  final hivePath = '${appDir.path}/${AppConfig.appName}';
  Hive.init(hivePath);

  Hive
    ..registerAdapter(ProfileDataModelAdapter())
    ..registerAdapter(AddressDataModelAdapter())
    ..registerAdapter(GeolocationDataModelAdapter())
    ..registerAdapter(NameModelAdapter())
    ..registerAdapter(ProductDataModelAdapter())
    ..registerAdapter(RatingDataModelAdapter());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<LoginCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ProductCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<CategoryCubit>(),
        ),
      ],
      child: MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: AppConfig.appName,
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        onGenerateRoute: _appRouter.onGenerateRoute,
        initialRoute: '/',
      ),
    );
  }
}
