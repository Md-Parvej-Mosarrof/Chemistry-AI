import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

/// Application theme configuration
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        tertiary: AppColors.accent,
        error: AppColors.error,
        background: AppColors.background,
        surface: AppColors.surface,
      ),
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStyles.title1.copyWith(
          color: AppColors.textPrimary,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 2,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: AppTextStyles.title2.copyWith(color: Colors.white),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: BorderSide(color: AppColors.primary),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: AppTextStyles.title2.copyWith(color: AppColors.primary),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: AppTextStyles.title2.copyWith(color: AppColors.primary),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceVariant,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.error, width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        hintStyle: AppTextStyles.body2.copyWith(color: AppColors.textTertiary),
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.headline1.copyWith(
          color: AppColors.textPrimary,
        ),
        displayMedium: AppTextStyles.headline2.copyWith(
          color: AppColors.textPrimary,
        ),
        displaySmall: AppTextStyles.headline3.copyWith(
          color: AppColors.textPrimary,
        ),
        headlineSmall: AppTextStyles.title1.copyWith(
          color: AppColors.textPrimary,
        ),
        titleLarge: AppTextStyles.title2.copyWith(color: AppColors.textPrimary),
        titleMedium: AppTextStyles.title3.copyWith(
          color: AppColors.textPrimary,
        ),
        bodyLarge: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
        bodyMedium: AppTextStyles.body2.copyWith(
          color: AppColors.textSecondary,
        ),
        bodySmall: AppTextStyles.caption.copyWith(
          color: AppColors.textSecondary,
        ),
        labelLarge: AppTextStyles.label1.copyWith(color: AppColors.textPrimary),
        labelSmall: AppTextStyles.label2.copyWith(
          color: AppColors.textSecondary,
        ),
      ),
      dividerColor: AppColors.divider,
      dividerTheme: DividerThemeData(
        color: AppColors.divider,
        space: 1,
        thickness: 1,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: AppColors.primaryLight,
        secondary: AppColors.secondaryLight,
        tertiary: AppColors.accentLight,
        error: AppColors.errorLight,
        background: AppColors.darkBackground,
        surface: AppColors.darkSurface,
      ),
      scaffoldBackgroundColor: AppColors.darkBackground,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkSurface,
        foregroundColor: AppColors.darkTextPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStyles.title1.copyWith(
          color: AppColors.darkTextPrimary,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.darkSurface,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.headline1.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        displayMedium: AppTextStyles.headline2.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        displaySmall: AppTextStyles.headline3.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        headlineSmall: AppTextStyles.title1.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        titleLarge: AppTextStyles.title2.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        titleMedium: AppTextStyles.title3.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        bodyLarge: AppTextStyles.body1.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        bodyMedium: AppTextStyles.body2.copyWith(
          color: AppColors.darkTextSecondary,
        ),
        bodySmall: AppTextStyles.caption.copyWith(
          color: AppColors.darkTextSecondary,
        ),
        labelLarge: AppTextStyles.label1.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        labelSmall: AppTextStyles.label2.copyWith(
          color: AppColors.darkTextSecondary,
        ),
      ),
    );
  }
}
