import 'package:ecom_clean_code/app/router/app_router.dart';
import 'package:ecom_clean_code/app/theme/theme_data.dart';
import 'package:ecom_clean_code/core/constants/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
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
    );
  }
}
