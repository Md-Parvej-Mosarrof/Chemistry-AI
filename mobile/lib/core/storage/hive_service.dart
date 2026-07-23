import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static const String homeBox = "home_box";

  static Future<void> init() async {
    await Hive.initFlutter();

    await Hive.openBox(homeBox);
  }

  static Box getHomeBox() {
    return Hive.box(homeBox);
  }
}