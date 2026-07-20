import 'package:flutter/material.dart';

class HomeContinueLearning extends StatelessWidget {
  const HomeContinueLearning({super.key});

  static const List<_LearningItem> _items = [
    _LearningItem(
      title: 'Mole Concept',
           category: 'Physical Chemistry',
      progress: 0.75,
    ),
    _LearningItem(
      title: 'Periodic Table',
      category: 'Inorganic Chemistry',
      progress: 0.45,
    ),
    _LearningItem(
      title: 'Hydrocarbons',
      category: 'Organic Chemistry',
      progress: 0.90,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
          itemCount: _items.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final item = _items[index];

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
                        color: Theme.of(context)
                            .colorScheme
                            .primaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.menu_book),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: theme.textTheme.titleMedium,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.category,
                            style: theme.textTheme.bodySmall,
                          ),
                          const SizedBox(height: 10),
                          LinearProgressIndicator(
                            value: item.progress,
                            borderRadius:
                                BorderRadius.circular(8),
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

class _LearningItem {
  final String title;
  final String category;
  final double progress;

  const _LearningItem({
    required this.title,
    required this.category,
    required this.progress,
  });
}