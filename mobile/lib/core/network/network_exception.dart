import 'package:dio/dio.dart';

class NetworkException implements Exception {
  final String message;

  const NetworkException(this.message);

  factory NetworkException.fromDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return const NetworkException(
          'Connection timeout. Please try again.',
        );

      case DioExceptionType.sendTimeout:
        return const NetworkException(
          'Request timeout. Please try again.',
        );

      case DioExceptionType.receiveTimeout:
        return const NetworkException(
          'Server took too long to respond.',
        );

      case DioExceptionType.connectionError:
        return const NetworkException(
          'No internet connection.',
        );

      case DioExceptionType.badCertificate:
        return const NetworkException(
          'Bad SSL certificate.',
        );

      case DioExceptionType.cancel:
        return const NetworkException(
          'Request cancelled.',
        );

      case DioExceptionType.badResponse:
        return _handleStatusCode(error.response?.statusCode);

      case DioExceptionType.unknown:
      default:
        return const NetworkException(
          'Unexpected error occurred.',
        );
    }
  }

  static NetworkException _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return const NetworkException('Bad request.');

      case 401:
        return const NetworkException('Unauthorized.');

      case 403:
        return const NetworkException('Access denied.');

      case 404:
        return const NetworkException('Resource not found.');

      case 500:
        return const NetworkException('Internal server error.');

      case 502:
        return const NetworkException('Bad gateway.');

      case 503:
        return const NetworkException('Service unavailable.');

      default:
        return const NetworkException('Something went wrong.');
    }
  }

  @override
  String toString() => message;
}