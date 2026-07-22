import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleRepository {
  static const _localeKey = 'app_locale';

  /// Save locale code (e.g. "en", "bn")
  Future<void> saveLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.languageCode);
  }

  /// Load saved locale
  Future<Locale> loadLocale() async {
    final prefs = await SharedPreferences.getInstance();

    final languageCode = prefs.getString(_localeKey);

    if (languageCode == null) {
      return const Locale('en');
    }

    return Locale(languageCode);
  }
}
