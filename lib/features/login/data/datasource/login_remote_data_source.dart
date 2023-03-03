import 'dart:convert';
import 'package:ecom_clean_code/core/data/base_remote_data_source.dart';
import 'package:ecom_clean_code/core/error/exceptions.dart';
import 'package:ecom_clean_code/features/login/data/model/login_data_model.dart';
import '../../../../core/constants/constants.dart';

abstract class LoginRemoteDataSource extends BaseRemoteDataSource {
  Future<LoginDataModel> loginUser(String username, String password);
}

class LoginUserRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements LoginRemoteDataSource {
  LoginUserRemoteDataSourceImpl(super.client, super.sharedPreferences);

  @override
  Future<LoginDataModel> loginUser(String username, String password) async {
    final response = await performPostRequest(
      ApiEndpoints.loginUrl,
      {
        "username": username,
        "password": password,
      },
      {
        'content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return LoginDataModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(response.body);
    }
  }
}
