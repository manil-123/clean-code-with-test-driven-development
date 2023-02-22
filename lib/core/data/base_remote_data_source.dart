import 'dart:convert';
import 'dart:io';
import 'package:ecom_clean_code/core/constants/configs.dart';
import 'package:http/http.dart' as http;

abstract class BaseRemoteDataSource {
  Future<http.Response> performPostRequest(
      String endpoint, Object? parameter, Map<String, String>? header);

  Future<http.Response> performGetRequest(
      String endpoint, Map<String, String>? headers);
}

class BaseRemoteDataSourceImpl extends BaseRemoteDataSource {
  final _timeoutDuration = const Duration(seconds: 25);
  final http.Client client;
  BaseRemoteDataSourceImpl(this.client);

  @override
  Future<http.Response> performGetRequest(
      String endpoint, Map<String, String>? headers) async {
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
    return (throw const SocketException(""));
  }
}
