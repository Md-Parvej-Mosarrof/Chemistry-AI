import '../entities/home_entity.dart';
import '../repositories/home_repository.dart';

class HomeUseCase {
  HomeUseCase(this._repository);

  final HomeRepository _repository;

  Future<List<HomeEntity>> call() {
    return _repository.getHomeData();
  }
}
