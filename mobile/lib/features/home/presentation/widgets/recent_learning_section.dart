import 'package:flutter/material.dart';
import 'chapter_card.dart';

class RecentLearningSection extends StatelessWidget {
  const RecentLearningSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Recent Learning',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: const [
              ChapterCard(
                title: 'Oxidation States',
                subtitle: 'Continue learning',
                icon: Icons.auto_fix_high,
                isHorizontal: false,
              ),
              SizedBox(height: 8),
              ChapterCard(
                title: 'Electron Configuration',
                subtitle: '5 lessons',
                icon: Icons.widgets,
                isHorizontal: false,
              ),
              SizedBox(height: 8),
              ChapterCard(
                title: 'Redox Reactions',
                subtitle: 'New chapter',
                icon: Icons.compare_arrows,
                isHorizontal: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
