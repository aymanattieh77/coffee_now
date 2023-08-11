class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}

class DatabaseException implements Exception {
  final String message;
  DatabaseException(this.message);
}

class CahceException implements Exception {
  final String message;
  CahceException(this.message);
}

class AuthException implements Exception {
  final String message;
  AuthException(this.message);
}
