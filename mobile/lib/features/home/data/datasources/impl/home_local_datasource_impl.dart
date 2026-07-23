import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../../models/home_model.dart';
import '../home_local_datasource.dart';

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  static const String _key = 'home_data';

  final Box _box;

  HomeLocalDataSourceImpl(this._box);

  @override
  Future<void> cacheHomeData(List<HomeModel> data) async {
    final jsonList = data.map((e) => e.toJson()).toList();

    await _box.put(_key, jsonEncode(jsonList));
  }

  @override
  Future<List<HomeModel>> getCachedHomeData() async {
    final jsonString = _box.get(_key);

    if (jsonString == null) {
      return [];
    }

    final List decoded = jsonDecode(jsonString);

    return decoded
        .map((e) => HomeModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }
}