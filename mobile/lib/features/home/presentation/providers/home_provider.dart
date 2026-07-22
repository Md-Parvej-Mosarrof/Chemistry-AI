import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/home_remote_datasource.dart';
import '../../data/datasources/home_remote_datasource_impl.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../../domain/repositories/home_repository.dart';
import '../../domain/usecases/home_usecase.dart';

/// Remote Data Source
final homeRemoteDataSourceProvider = Provider<HomeRemoteDataSource>((ref) {
  return HomeRemoteDataSourceImpl();
});

/// Repository
final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepositoryImpl(ref.read(homeRemoteDataSourceProvider));
});

/// UseCase
final homeUseCaseProvider = Provider<HomeUseCase>((ref) {
  return HomeUseCase(ref.read(homeRepositoryProvider));
});
