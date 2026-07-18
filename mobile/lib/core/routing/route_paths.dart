/// Central location for all route paths in the app
class RoutePaths {
  // Root
  static const String root = '/';

  // Auth
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';

  // Main navigation
  static const String home = '/home';
  static const String chapters = '/chapters';
  static const String chapter = '/chapter/:id';
  static const String lesson = '/lesson/:id';
  static const String quiz = '/quiz/:id';
  static const String quizResults = '/quiz-results/:id';
  static const String aiTutor = '/ai-tutor';
  static const String search = '/search';

  // User
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String progress = '/progress';
  static const String bookmarks = '/bookmarks';

  // Static content
  static const String periodicTable = '/periodic-table';
  static const String glossary = '/glossary';
  static const String help = '/help';
}
