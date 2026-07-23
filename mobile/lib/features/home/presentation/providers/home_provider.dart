import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/storage/hive_service.dart';
import '../../data/datasources/home_local_datasource.dart';
import '../../data/datasources/impl/home_local_datasource_impl.dart';
import '../../../../core/network/dio_client.dart';
import '../../data/datasources/home_remote_datasource.dart';
import '../../data/datasources/home_remote_datasource_impl.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../../domain/repositories/home_repository.dart';
import '../../domain/usecases/home_usecase.dart';

/// Hive Box
final homeBoxProvider = Provider<Box>((ref) {
  return HiveService.getHomeBox();
});

/// Local Data Source
final homeLocalDataSourceProvider = Provider<HomeLocalDataSource>((ref) {
  return HomeLocalDataSourceImpl(
    ref.read(homeBoxProvider),
  );
});

/// Remote Data Source
final homeRemoteDataSourceProvider = Provider<HomeRemoteDataSource>((ref) {
  return HomeRemoteDataSourceImpl(
    ref.read(dioProvider),
  );
});

/// Repository
final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepositoryImpl(
    ref.read(homeRemoteDataSourceProvider),
    ref.read(homeLocalDataSourceProvider),
  );
});

/// UseCase
final homeUseCaseProvider = Provider<HomeUseCase>((ref) {
  return HomeUseCase(
    ref.read(homeRepositoryProvider),
  );
});