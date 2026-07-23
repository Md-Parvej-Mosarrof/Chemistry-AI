import 'package:dio/dio.dart';

import '../../../../core/network/dio_client.dart';
import '../models/home_model.dart';
import 'home_remote_datasource.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  HomeRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<HomeModel>> getHomeData() async {
    final response = await _dio.get('/home');

    final List<dynamic> data = response.data;

    return data
        .map((e) => HomeModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}