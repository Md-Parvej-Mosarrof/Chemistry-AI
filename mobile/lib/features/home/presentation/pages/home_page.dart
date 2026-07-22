import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/connectivity_provider.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/home_notifier.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_bottom_navigation.dart';
import '../widgets/home_category_grid.dart';
import '../widgets/home_continue_learning.dart';
import '../widgets/home_featured_chapters.dart';
import '../widgets/home_search_box.dart';
import '../../../../core/utils/responsive.dart';
import '../widgets/featured_section.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _selectedNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    final connection = ref.watch(connectivityProvider);
    final homeState = ref.watch(homeNotifierProvider);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 20),
        child: HomeAppBar(),
      ),
      body: connection.when(
        data: (isConnected) {
          if (!isConnected) {
            return const Center(
              child: Text(
                'No Internet Connection',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          }

          if (homeState.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (homeState.error != null) {
            return Center(child: Text(homeState.error!));
          }

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.horizontalPadding(context),
            ),
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
                FeaturedSection(),
                const SizedBox(height: 24),
                const HomeContinueLearning(),
                const SizedBox(height: 32),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            Center(child: Text('Connection Error: $error')),
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
