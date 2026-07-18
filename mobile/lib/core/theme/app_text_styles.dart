import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Application typography styles
class AppTextStyles {
  // Headlines
  static const TextStyle headline1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    height: 1.25,
    letterSpacing: -0.5,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    height: 1.29,
    letterSpacing: 0,
  );

  static const TextStyle headline3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    height: 1.33,
    letterSpacing: 0,
  );

  // Title
  static const TextStyle title1 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0.15,
  );

  static const TextStyle title2 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    letterSpacing: 0.1,
  );

  static const TextStyle title3 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.57,
    letterSpacing: 0.1,
  );

  // Body
  static const TextStyle body1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 1.5,
    letterSpacing: 0.5,
  );

  static const TextStyle body2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.57,
    letterSpacing: 0.25,
  );

  // Label
  static const TextStyle label1 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.67,
    letterSpacing: 0.5,
  );

  static const TextStyle label2 = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 1.45,
    letterSpacing: 0.5,
  );

  // Caption
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    height: 1.33,
    letterSpacing: 0.4,
  );
}
