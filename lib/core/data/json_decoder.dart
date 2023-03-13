import 'dart:convert';
import 'package:ecom_clean_code/core/constants/constants.dart';
import 'package:ecom_clean_code/core/error/exceptions.dart';
import 'package:http/http.dart';

dynamic jsonDecodeAndHandleException(Response response) {
  try {
    if (response.statusCode != 200) {
      _returnResponse(response);
    }
    final json = jsonDecode(response.body);
    return json;
  } catch (error) {
    rethrow;
  }
}

dynamic _returnResponse(Response response) {
  switch (response.statusCode) {
    case 401:
      throw UnauthorisedException(ErrorMessage.unauthorisedErrorMessage);
    case 404:
      throw NotFoundException(ErrorMessage.notFoundErrorMessage);
    case 500:
    default:
      throw FetchDataException(ErrorMessage.somethingWentWrongFailureMessage);
  }
}
