import 'dart:convert';
import 'dart:io';
import 'package:ecom_clean_code/core/constants/configs.dart';
import 'package:ecom_clean_code/core/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseRemoteDataSource {
  Future<http.Response> performPostRequest(
      String endpoint, Object? parameter, Map<String, String>? header);

  Future<http.Response> performGetRequest(String endpoint);
}

@LazySingleton(as: BaseRemoteDataSource)
class BaseRemoteDataSourceImpl extends BaseRemoteDataSource {
  final _timeoutDuration = const Duration(seconds: 25);
  final http.Client client;
  final SharedPreferences sharedPreferences;
  BaseRemoteDataSourceImpl(this.client, this.sharedPreferences);

  @override
  Future<http.Response> performGetRequest(String endpoint) async {
    final token =
        sharedPreferences.getString(SharedPreferencesConstants.authToken) ?? '';
    final headers = {
      'Authorization': token,
      'content-type': 'application/json',
    };
    return await client
        .get(
          Uri.parse(ApiConfig.apiBaseUrl + endpoint),
          headers: headers,
        )
        .timeout(_timeoutDuration, onTimeout: onTimeout);
  }

  @override
  Future<http.Response> performPostRequest(
    String endpoint,
    Object? parameter,
    Map<String, String>? header,
  ) async {
    return await client
        .post(
          Uri.parse(ApiConfig.apiBaseUrl + endpoint),
          body: json.encode(parameter),
          headers: header,
        )
        .timeout(_timeoutDuration, onTimeout: onTimeout);
  }

  Never onTimeout() {
    return (throw const SocketException(ErrorMessage.socketExceptionMessage));
  }
}
