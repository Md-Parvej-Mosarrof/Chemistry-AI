import 'package:flutter/material.dart';
import 'locale_repository.dart';

class LocaleNotifier extends ChangeNotifier {
  LocaleNotifier(this._repository);

  final LocaleRepository _repository;

  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  /// App শুরু হলে saved language load করবে
  Future<void> loadLocale() async {
    _locale = await _repository.loadLocale();
    notifyListeners();
  }

  /// Language change করবে এবং save করবে
  Future<void> changeLocale(Locale locale) async {
    if (_locale.languageCode == locale.languageCode) return;

    _locale = locale;

    await _repository.saveLocale(locale);

    notifyListeners();
  }
}