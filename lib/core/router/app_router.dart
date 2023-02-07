import 'package:ecom_clean_code/features/login/presentation/pages/login_screen.dart';
import 'package:ecom_clean_code/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  MaterialPageRoute onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case LoginScreen.route:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
    }
  }
}
