import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../../features/home/data/models/home_model.dart';

class HomeCacheService {
  static const String _boxName = 'home_box';
  static const String _key = 'home_data';

  Future<void> save(List<HomeModel> data) async {
    final box = await Hive.openBox(_boxName);

    final jsonList = data.map((e) => e.toJson()).toList();

    await box.put(_key, jsonEncode(jsonList));
  }

  Future<List<HomeModel>> load() async {
    final box = await Hive.openBox(_boxName);

    final raw = box.get(_key);

    if (raw == null) return [];

    final List<dynamic> decoded = jsonDecode(raw);

    return decoded
        .map((e) => HomeModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  Future<void> clear() async {
    final box = await Hive.openBox(_boxName);

    await box.delete(_key);
  }
}