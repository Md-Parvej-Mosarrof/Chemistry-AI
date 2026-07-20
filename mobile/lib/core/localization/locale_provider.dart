import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'locale_notifier.dart';
import 'locale_repository.dart';

final localeRepositoryProvider = Provider<LocaleRepository>((ref) {
  return LocaleRepository();
});

final localeProvider =
    ChangeNotifierProvider<LocaleNotifier>((ref) {
  final repository = ref.watch(localeRepositoryProvider);

  return LocaleNotifier(repository);
});