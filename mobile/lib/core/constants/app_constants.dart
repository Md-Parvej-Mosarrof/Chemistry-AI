/// Application-wide constants
class AppConstants {
  /// Base API URL for backend connection
  static const String baseUrl =  'https://6a621fb11bffb2ffab8af4b1.mockapi.io';

  /// Request timeout in seconds
  static const int requestTimeout = 30;

  /// Cache duration in days
  static const int cacheDurationDays = 7;

  /// App name
  static const String appName = 'Chemistry Learning';

  /// App version
  static const String appVersion = '1.0.0';

  // Feature flags
  static const bool enableOfflineMode = true;
  static const bool enableAnalytics = true;

  // Curriculum levels
  static const List<String> curriculumLevels = ['SSC', 'HSC', 'Honours'];

  // Supported languages
  static const List<String> supportedLanguages = ['en', 'bn'];
}
