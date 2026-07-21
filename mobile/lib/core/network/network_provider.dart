import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dio_client.dart';
import 'network_info.dart';

/// NetworkInfo Provider
final networkInfoProvider = Provider<NetworkInfo>((ref) {
  return NetworkInfo();
});