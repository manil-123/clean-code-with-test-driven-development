import 'package:ecom_clean_code/core/constants/routes.dart';
import 'package:ecom_clean_code/features/login/presentation/blocs/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    final loginStatus = await BlocProvider.of<LoginCubit>(context).isLoggedIn();
    if (!mounted) return;
    if (loginStatus) {
      _navigateToNextScreen(context, () {
        Navigator.of(context).pushReplacementNamed(Routes.dashboardPageRoute);
      });
    } else {
      _navigateToNextScreen(context, () {
        Navigator.of(context).pushReplacementNamed(Routes.loginPageRoute);
      });
    }
  }

  void _navigateToNextScreen(
      BuildContext context, VoidCallback onSuccess) async {
    await Future.delayed(
      const Duration(milliseconds: 2000),
    );
    onSuccess.call();
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
