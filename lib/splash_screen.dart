import 'package:ecom_clean_code/core/constants/routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.of(context).pushReplacementNamed(Routes.loginPageRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
