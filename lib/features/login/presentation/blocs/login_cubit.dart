import 'dart:developer';

import 'package:ecom_clean_code/core/constants/constants.dart';
import 'package:ecom_clean_code/features/login/domain/entities/login_model.dart';
import 'package:ecom_clean_code/features/login/domain/usecase/login_user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUser loginUser;
  final SharedPreferences sharedPreferences;
  LoginCubit(this.loginUser, this.sharedPreferences) : super(LoginInitial());

  Future<bool> isLoggedIn() async {
    final authToken =
        sharedPreferences.getString(SharedPreferencesConstants.authToken);
    if (authToken == null) {
      emit(LoginInitial());
      return false;
    } else {
      return true;
    }
  }

  void login(String username, String password) async {
    emit(LoginLoading());

    final response = await loginUser
        .call(LoginParams(username: username, password: password));
    response.fold(
      (failure) {
        emit(
          LoginFailed(
            errorMessage: failure.failureMessage,
          ),
        );
      },
      (loginModel) async {
        sharedPreferences.setString(
            SharedPreferencesConstants.authToken, loginModel.token);
        emit(
          LoginLoaded(loginModel: loginModel),
        );
      },
    );
  }

  void logOut() {
    sharedPreferences.clear();
  }
}
