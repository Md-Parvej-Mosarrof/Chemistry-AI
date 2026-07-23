import 'package:dio/dio.dart';

import '../../domain/entities/home_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_local_datasource.dart';
import '../datasources/home_remote_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
  );

  final HomeRemoteDataSource _remoteDataSource;
  final HomeLocalDataSource _localDataSource;

  @override
  Future<List<HomeEntity>> getHomeData() async {
    try {
      // Fetch from API
      final models = await _remoteDataSource.getHomeData();

      // Cache locally
      await _localDataSource.cacheHomeData(models);

      return models.map((e) => e.toEntity()).toList();
    } on DioException catch (e) {
      // Try cached data if network fails
      final cached = await _localDataSource.getCachedHomeData();

      if (cached.isNotEmpty) {
        return cached.map((e) => e.toEntity()).toList();
      }

      throw Exception(_mapDioError(e));
    } catch (_) {
      // Try cached data for any other error
      final cached = await _localDataSource.getCachedHomeData();

      if (cached.isNotEmpty) {
        return cached.map((e) => e.toEntity()).toList();
      }

      throw Exception(
        'Something went wrong. Please try again.',
      );
    }
  }

  String _mapDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout. Please try again.';

      case DioExceptionType.sendTimeout:
        return 'Request timeout. Please try again.';

      case DioExceptionType.receiveTimeout:
        return 'Server took too long to respond.';

      case DioExceptionType.connectionError:
        return 'No internet connection.';

      case DioExceptionType.badResponse:
        return 'Server error (${e.response?.statusCode}).';

      case DioExceptionType.cancel:
        return 'Request cancelled.';

      default:
        return 'Unexpected network error.';
    }
  }
}