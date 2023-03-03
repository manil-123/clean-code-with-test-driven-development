import 'package:ecom_clean_code/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

void showErrorInfo(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(_getErrorWidget(errorMessage));
}

void showInfo(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(_getMessageWidget(message));
}

SnackBar _getErrorWidget(String errorMessage) {
  return SnackBar(
    duration: const Duration(seconds: 3),
    content: Text(
      errorMessage,
      style: const TextStyle(color: Colors.white, fontSize: 16),
    ),
    backgroundColor: AppColors.secondaryDark,
    behavior: SnackBarBehavior.floating,
    elevation: 0,
    action: SnackBarAction(
      label: 'Ok',
      onPressed: () => {},
      disabledTextColor: Colors.white,
      textColor: Colors.white,
    ),
  );
}

SnackBar _getMessageWidget(String message) {
  return SnackBar(
    duration: const Duration(seconds: 60),
    content: Text(
      message,
      style: const TextStyle(color: Colors.white, fontSize: 16),
    ),
    backgroundColor: Colors.green,
    behavior: SnackBarBehavior.floating,
    elevation: 0,
    action: SnackBarAction(
      label: 'Ok',
      onPressed: () => {},
      disabledTextColor: Colors.white,
      textColor: Colors.white,
    ),
  );
}
