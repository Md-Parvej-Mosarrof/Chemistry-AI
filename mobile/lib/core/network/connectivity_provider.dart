import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'network_info.dart';

final connectivityProvider = FutureProvider<bool>((ref) async {
  final network = NetworkInfo();
  return network.isConnected;
});