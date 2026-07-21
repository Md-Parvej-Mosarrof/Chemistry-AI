import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/pages/home_page.dart';


class RoutePaths {
  static const String home = '/';
  static const String chapters = '/chapters';
  static const String quiz = '/quiz';
  static const String profile = '/profile';
}

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RoutePaths.home,
    routes: [
      GoRoute(
        path: RoutePaths.home,
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: RoutePaths.chapters,
        name: 'chapters',
        builder: (context, state) => Scaffold(
          appBar: AppBar(title: const Text('Chapters')),
          body: const Center(
            child: Text('Chapters Screen'),
          ),
        ),
      ),
      GoRoute(
        path: RoutePaths.quiz,
        name: 'quiz',
        builder: (context, state) => Scaffold(
          appBar: AppBar(title: const Text('Quiz')),
          body: const Center(
            child: Text('Quiz Screen'),
          ),
        ),
      ),
      GoRoute(
        path: RoutePaths.profile,
        name: 'profile',
        builder: (context, state) => Scaffold(
          appBar: AppBar(title: const Text('Profile')),
          body: const Center(
            child: Text('Profile Screen'),
          ),
        ),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text('Page not found'),
      ),
    ),
  );
});