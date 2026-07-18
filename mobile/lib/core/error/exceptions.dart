/// Base exception class for the app
abstract class AppException implements Exception {
  final String message;
  final String? code;

  AppException({
    required this.message,
    this.code,
  });

  @override
  String toString() => message;
}

/// Network-related exceptions
class NetworkException extends AppException {
  NetworkException({
    required String message,
    String? code,
  }) : super(message: message, code: code);
}

/// Server-side exceptions
class ServerException extends AppException {
  final int? statusCode;

  ServerException({
    required String message,
    this.statusCode,
    String? code,
  }) : super(message: message, code: code);
}

/// Cache-related exceptions
class CacheException extends AppException {
  CacheException({
    required String message,
    String? code,
  }) : super(message: message, code: code);
}

/// Authentication exceptions
class AuthException extends AppException {
  AuthException({
    required String message,
    String? code,
  }) : super(message: message, code: code);
}

/// Validation exceptions
class ValidationException extends AppException {
  ValidationException({
    required String message,
    String? code,
  }) : super(message: message, code: code);
}

/// Unknown/generic exceptions
class UnknownException extends AppException {
  UnknownException({
    String? message,
    String? code,
  }) : super(message: message ?? 'Unknown error occurred', code: code);
}
