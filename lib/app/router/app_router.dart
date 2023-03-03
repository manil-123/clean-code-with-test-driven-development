import 'package:ecom_clean_code/core/constants/routes.dart';
import 'package:ecom_clean_code/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:ecom_clean_code/features/home/presentation/pages/home_screen.dart';
import 'package:ecom_clean_code/features/login/presentation/pages/login_screen.dart';
import 'package:ecom_clean_code/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  MaterialPageRoute onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.loginPageRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.homePageRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.dashboardPageRoute:
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
    }
  }
}
