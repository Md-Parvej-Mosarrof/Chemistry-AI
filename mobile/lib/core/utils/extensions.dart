import 'package:flutter/material.dart';

/// Extension methods for BuildContext
extension BuildContextExtension on BuildContext {
  /// Get screen width
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Get screen height
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Check if device is in portrait mode
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;

  /// Check if device is in landscape mode
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  /// Check if device is mobile (width < 600)
  bool get isMobile => screenWidth < 600;

  /// Check if device is tablet (width >= 600)
  bool get isTablet => screenWidth >= 600;

  /// Get device padding
  EdgeInsets get devicePadding => MediaQuery.of(this).padding;

  /// Get device view insets (keyboard height)
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  /// Show a snackbar
  void showSnackBar(String message,
      {Duration duration = const Duration(seconds: 2)}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
      ),
    );
  }
}

/// Extension methods for String
extension StringExtension on String {
  /// Capitalize first letter
  String get capitalize =>
      isEmpty ? this : this[0].toUpperCase() + substring(1);

  /// Check if email is valid
  bool get isValidEmail {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(this);
  }

  /// Check if password is strong
  bool get isStrongPassword {
    return length >= 8 &&
        contains(RegExp(r'[A-Z]')) &&
        contains(RegExp(r'[a-z]')) &&
        contains(RegExp(r'[0-9]'));
  }
}

/// Extension methods for DateTime
extension DateTimeExtension on DateTime {
  /// Format as "d/M/yyyy"
  String get formattedDate => '$day/$month/$year';

  /// Format as "h:mm a"
  String get formattedTime {
    final hour = this.hour > 12 ? this.hour - 12 : this.hour;
    final period = this.hour >= 12 ? 'PM' : 'AM';
    return '$hour:${minute.toString().padLeft(2, '0')} $period';
  }

  /// Format as "d/M/yyyy h:mm a"
  String get formattedDateTime => '$formattedDate $formattedTime';

  /// Check if date is today
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Check if date is yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }
}

/// Extension methods for int
extension IntExtension on int {
  /// Convert seconds to formatted duration string
  String get formattedDuration {
    final minutes = this ~/ 60;
    final seconds = this % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}
