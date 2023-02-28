import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color.fromARGB(0, 233, 231, 231);
  static const primaryColorDark = Color.fromARGB(0, 195, 192, 192);
  static const primaryColorLight = Color.fromARGB(0, 210, 207, 207);
  static const errorIconColor = Color(0xffF43400);
  static const greyColor = Color(0XFF9B9999);
  static const darkGreyColor = Color(0XFF424241);
}

class ErrorMessage {
  static const serverFailureMessage = "Server failure";
  static const cacheFailureMessage = "Cache failure";
  static const internetFailureMessage = "No internet connection";
  static const socketExceptionMessage = "Connection failed";
  static const somethingWentWrongFailureMessage = 'Something went wrong!!';
}

class ApiEndpoints {
  static const loginUrl = "auth/login";
}

class StringConstant {
  static const loginText = 'Login';
  static const logoutText = 'Log Out';
}

class SharedPreferencesConstants {
  static const authToken = "authToken";
}
