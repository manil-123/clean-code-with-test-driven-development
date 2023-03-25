import 'package:ecom_clean_code/core/constants/routes.dart';
import 'package:ecom_clean_code/features/login/presentation/blocs/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecom_clean_code/core/widgets/message_widget.dart'
    as message_widget;

class LoginButton extends StatelessWidget {
  final String label;
  final GlobalKey<FormState> formKey;
  final void Function() onPressed;

  const LoginButton({
    Key? key,
    required this.label,
    required this.formKey,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: ((context, state) {
        if (state is LoginLoaded) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.dashboardPageRoute, (route) => false);
          message_widget.showInfo(context, "Login successful");
        } else if (state is LoginFailed) {
          message_widget.showErrorInfo(context, state.errorMessage);
        }
      }),
      builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24)),
          onPressed:
              (state is LoginLoading) ? null : () async => _login(context),
          child: (state is LoginLoading)
              ? SizedBox(
                  height: 24,
                  width: 24,
                  child: const CircularProgressIndicator(
                      color: Colors.white, strokeWidth: 3.0),
                )
              : Text(
                  label,
                ),
        );
      },
    );
  }

  Future<void> _login(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    } else {
      onPressed();
    }
  }
}
