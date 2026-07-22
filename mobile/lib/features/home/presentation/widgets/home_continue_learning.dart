import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/home_notifier.dart';

class HomeContinueLearning extends ConsumerWidget {
  const HomeContinueLearning({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeNotifierProvider);

    final theme = Theme.of(context);

    if (homeState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (homeState.error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Something went wrong", style: theme.textTheme.titleMedium),

            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                ref.read(homeNotifierProvider.notifier).loadHomeData();
              },
              child: const Text("Retry"),
            ),
          ],
        ),
      );
    }

    final items = homeState.data;

    if (items.isEmpty) {
      return const Center(child: Text("No learning data available"));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          'Continue Learning',

          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 16),

        ListView.separated(
          shrinkWrap: true,

          physics: const NeverScrollableScrollPhysics(),

          itemCount: items.length,

          separatorBuilder: (_, __) => const SizedBox(height: 12),

          itemBuilder: (context, index) {
            final item = items[index];

            return Card(
              elevation: 1,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),

              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Row(
                  children: [
                    Container(
                      width: 60,

                      height: 60,

                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,

                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: const Icon(Icons.menu_book),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(item.title, style: theme.textTheme.titleMedium),

                          const SizedBox(height: 4),

                          Text(item.subtitle, style: theme.textTheme.bodySmall),

                          const SizedBox(height: 10),

                          LinearProgressIndicator(
                            value: item.progress,

                            borderRadius: BorderRadius.circular(8),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 12),

                    Text(
                      '${(item.progress * 100).round()}%',

                      style: theme.textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
