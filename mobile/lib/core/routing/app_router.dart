import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Routes paths
class RoutePaths {
  static const String home = '/';
  static const String chapters = '/chapters';
  static const String quiz = '/quiz';
  static const String profile = '/profile';
}

/// GoRouter provider for route configuration
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RoutePaths.home,
    routes: [
      GoRoute(
        path: RoutePaths.home,
        name: 'home',
        builder: (context, state) {
          // TODO: Implement home screen
          return Scaffold(
            appBar: AppBar(title: const Text('Chemistry Learning')),
            body: const Center(child: Text('Home Screen')),
          );
        },
      ),
      GoRoute(
        path: RoutePaths.chapters,
        name: 'chapters',
        builder: (context, state) {
          // TODO: Implement chapters screen
          return Scaffold(
            appBar: AppBar(title: const Text('Chapters')),
            body: const Center(child: Text('Chapters Screen')),
          );
        },
      ),
      GoRoute(
        path: RoutePaths.quiz,
        name: 'quiz',
        builder: (context, state) {
          // TODO: Implement quiz screen
          return Scaffold(
            appBar: AppBar(title: const Text('Quiz')),
            body: const Center(child: Text('Quiz Screen')),
          );
        },
      ),
      GoRoute(
        path: RoutePaths.profile,
        name: 'profile',
        builder: (context, state) {
          // TODO: Implement profile screen
          return Scaffold(
            appBar: AppBar(title: const Text('Profile')),
            body: const Center(child: Text('Profile Screen')),
          );
        },
      ),
    ],
   errorBuilder: (context, state) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Error'),
    ),
    body: const Center(
      child: Text('Page not found'),
    ),
  );
}, );
});