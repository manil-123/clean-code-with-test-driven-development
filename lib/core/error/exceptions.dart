class ServerException implements Exception {
  String exceptionMessage;
  ServerException(this.exceptionMessage);
}

class CacheException implements Exception {
  String exceptionMessage;
  CacheException(this.exceptionMessage);
}

class NotFoundException implements Exception {
  String exceptionMessage = '404 not found';
  NotFoundException(this.exceptionMessage);
}

class UnauthorisedException implements Exception {
  String exceptionMessage = 'Not authorised';
  UnauthorisedException(this.exceptionMessage);
}

class FetchDataException implements Exception {
  String exceptionMessage = 'Error during communication';
  FetchDataException(this.exceptionMessage);
}

class CartException implements Exception {
  String exceptionMessage;
  CartException(this.exceptionMessage);
}
