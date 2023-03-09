import 'package:ecom_clean_code/app/theme/app_colors.dart';
import 'package:ecom_clean_code/core/widgets/custom_text_field.dart';
import 'package:ecom_clean_code/features/login/presentation/blocs/login_cubit.dart';
import 'package:ecom_clean_code/features/login/presentation/widgets/app-name.dart';
import 'package:ecom_clean_code/features/login/presentation/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 1],
                colors: AppColors.backgroundGradient,
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 24,
            right: 24,
            child: Align(
              alignment: Alignment.center,
              child: appName(context),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.all(24.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6.0),
                  topRight: Radius.circular(6.0),
                ),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                      controller: _usernameController,
                      labelText: "Username",
                      keyboardType: TextInputType.name,
                      validator: (String? username) {
                        if (username!.isEmpty) {
                          return "User name cannot be empty";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      controller: _passwordController,
                      labelText: "Password",
                      obsecure: _obsecureText,
                      suffixIcon: _obsecureText
                          ? Icons.visibility_outlined
                          : Icons.visibility_off,
                      onSufficIconPress: () {
                        setState(() {
                          _obsecureText = !_obsecureText;
                        });
                      },
                      validator: (String? username) {
                        if (username!.isEmpty) {
                          return "Password cannot be empty";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: LoginButton(
                        key: Key('login'),
                        label: 'LOGIN',
                        formKey: _formKey,
                        onPressed: () => context.read<LoginCubit>().login(
                              _usernameController.text,
                              _passwordController.text,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
