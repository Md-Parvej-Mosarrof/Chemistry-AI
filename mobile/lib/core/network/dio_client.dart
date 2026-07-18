import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/app_constants.dart';

/// Dio HTTP client provider
final dioProvider = Provider<Dio>((ref) {
  return _createDioClient();
});

/// Create and configure Dio client
Dio _createDioClient() {
  final dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: Duration(seconds: AppConstants.requestTimeout),
      receiveTimeout: Duration(seconds: AppConstants.requestTimeout),
      responseType: ResponseType.json,
      contentType: Headers.jsonContentType,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  // Add interceptors
  dio.interceptors.add(_LoggingInterceptor());
  dio.interceptors.add(_ErrorInterceptor());

  return dio;
}

/// Logging interceptor for debugging
class _LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('→ REQUEST: ${options.method} ${options.path}');
    print('  Headers: ${options.headers}');
    if (options.data != null) {
      print('  Data: ${options.data}');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('← RESPONSE: ${response.statusCode} ${response.requestOptions.path}');
    print('  Data: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('✗ ERROR: ${err.response?.statusCode} ${err.requestOptions.path}');
    print('  Message: ${err.message}');
    super.onError(err, handler);
  }
}

/// Error interceptor for handling HTTP errors
class _ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle specific error cases if needed
    super.onError(err, handler);
  }
}
