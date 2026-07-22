import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/home_model.dart';
import 'home_remote_datasource.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<List<HomeModel>> getHomeData() async {
    final jsonString = await rootBundle.loadString('assets/mock/home.json');

    final List<dynamic> decoded = json.decode(jsonString);

    return decoded
        .map((e) => HomeModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
