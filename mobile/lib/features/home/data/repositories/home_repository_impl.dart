import '../../domain/entities/home_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._remoteDataSource);

  final HomeRemoteDataSource _remoteDataSource;

  @override
  Future<List<HomeEntity>> getHomeData() async {
    final models = await _remoteDataSource.getHomeData();

    return models.map((model) => model.toEntity()).toList();
  }
}
