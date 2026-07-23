import '../models/home_model.dart';

abstract class HomeLocalDataSource {
  Future<void> cacheHomeData(List<HomeModel> data);

  Future<List<HomeModel>> getCachedHomeData();
}