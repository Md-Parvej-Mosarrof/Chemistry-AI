import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/search_box.dart';
import '../widgets/category_card.dart';
import '../widgets/featured_section.dart';
import '../widgets/recent_learning_section.dart';
import '../widgets/bottom_nav_bar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Custom AppBar
              const HomeAppBar(),
              // Welcome Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello,',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: Colors.grey[600],
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Welcome to Chemistry AI',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              // Search Box
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SearchBox(),
              ),
              const SizedBox(height: 24),
              // Category Section Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Categories',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Category Grid
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.0,
                  children: const [
                    CategoryCard(
                      icon: Icons.grain,
                      title: 'Organic Chemistry',
                    ),
                    CategoryCard(
                      icon: Icons.science,
                      title: 'Inorganic Chemistry',
                    ),
                    CategoryCard(
                      icon: Icons.thermostat,
                      title: 'Physical Chemistry',
                    ),
                    CategoryCard(
                      icon: Icons.analytics,
                      title: 'Analytical Chemistry',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Featured Chapters Section
              const FeaturedSection(),
              const SizedBox(height: 32),
              // Recent Learning Section
              const RecentLearningSection(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
    );
  }
}
