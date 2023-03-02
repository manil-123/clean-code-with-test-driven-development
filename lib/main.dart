import 'package:ecom_clean_code/app/router/app_router.dart';
import 'package:ecom_clean_code/app/theme/theme_data.dart';
import 'package:ecom_clean_code/core/constants/configs.dart';
import 'package:ecom_clean_code/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/login/presentation/blocs/login_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<LoginCubit>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(UiConfig.kWidth, UiConfig.kHeight),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: ((context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            onGenerateRoute: _appRouter.onGenerateRoute,
            initialRoute: '/',
          );
        }),
      ),
    );
  }
}
