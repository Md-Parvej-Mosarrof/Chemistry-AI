import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/responsive.dart';
import '../providers/home_notifier.dart';

class HomeCategoryGrid extends ConsumerWidget {
  const HomeCategoryGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeNotifierProvider);

    if (homeState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (homeState.error != null) {
      return Center(child: Text(homeState.error!));
    }

    final categories = homeState.data;

    if (categories.isEmpty) {
      return const Center(child: Text("No categories available"));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          "Categories",

          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 14),

        GridView.builder(
          shrinkWrap: true,

          physics: const NeverScrollableScrollPhysics(),

          itemCount: categories.length,

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Responsive.gridCount(context),

            crossAxisSpacing: 14,

            mainAxisSpacing: 14,

            childAspectRatio: 1.8,
          ),

          itemBuilder: (context, index) {
            final category = categories[index];

            return Container(
              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(18),

                border: Border.all(color: Colors.grey.shade200),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const Icon(Icons.science, size: 32),

                  const SizedBox(height: 8),

                  Text(
                    category.category,

                    maxLines: 1,

                    overflow: TextOverflow.ellipsis,

                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
