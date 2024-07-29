// lib/core/errors/exceptions.dart

/// Base class for all exceptions in the app.
class AppException implements Exception {
  final String message;
  AppException(this.message);
}

/// Exception thrown when user authentication fails.
class AuthenticationException extends AppException {
  AuthenticationException(String message) : super(message);
}

/// Exception thrown when network connectivity is unavailable.
class NetworkException extends AppException {
  NetworkException(String message) : super(message);
}
