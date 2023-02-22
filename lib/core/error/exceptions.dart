class ServerException implements Exception {
  String exceptionMessage;
  ServerException(this.exceptionMessage);
}

class CacheException implements Exception {
  String exceptionMessage;
  CacheException(this.exceptionMessage);
}
