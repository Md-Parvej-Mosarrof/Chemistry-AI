/// Base failure class for representing errors in the app
abstract class Failure {
  final String message;
  final String? code;

  Failure({required this.message, this.code});

  @override
  String toString() => message;
}

/// Network failure
class NetworkFailure extends Failure {
  NetworkFailure({String message = 'Network error occurred', String? code})
    : super(message: message, code: code);
}

/// Server failure
class ServerFailure extends Failure {
  final int? statusCode;

  ServerFailure({
    String message = 'Server error occurred',
    this.statusCode,
    String? code,
  }) : super(message: message, code: code);
}

/// Cache failure
class CacheFailure extends Failure {
  CacheFailure({String message = 'Cache error occurred', String? code})
    : super(message: message, code: code);
}

/// Authentication failure
class AuthFailure extends Failure {
  AuthFailure({String message = 'Authentication failed', String? code})
    : super(message: message, code: code);
}

/// Validation failure
class ValidationFailure extends Failure {
  ValidationFailure({String message = 'Validation failed', String? code})
    : super(message: message, code: code);
}

/// Unknown failure
class UnknownFailure extends Failure {
  UnknownFailure({String message = 'Unknown error occurred', String? code})
    : super(message: message, code: code);
}
