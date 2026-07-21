import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_bottom_navigation.dart';
import '../widgets/home_category_grid.dart';
import '../widgets/home_continue_learning.dart';
import '../widgets/home_featured_chapters.dart';
import '../widgets/home_search_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 20),
        child: HomeAppBar(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.welcomeMessage,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const HomeSearchBox(),
            const SizedBox(height: 24),
            const HomeCategoryGrid(),
            const SizedBox(height: 24),
            const HomeFeaturedChapters(),
            const SizedBox(height: 24),
            const HomeContinueLearning(),
            const SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: HomeBottomNavigation(
        selectedIndex: _selectedNavIndex,
        onIndexChanged: (index) {
          setState(() {
            _selectedNavIndex = index;
          });
        },
      ),
    );
  }
}