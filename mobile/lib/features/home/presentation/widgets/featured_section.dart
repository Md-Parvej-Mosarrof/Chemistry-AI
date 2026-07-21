import 'package:flutter/material.dart';
import 'chapter_card.dart';

class FeaturedSection extends StatelessWidget {
  const FeaturedSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Featured Chapters',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: const [
              ChapterCard(
                title: 'Chemical Bond',
                icon: Icons.link,
                isHorizontal: true,
              ),
              SizedBox(width: 12),
              ChapterCard(
                title: 'Periodic Table',
                icon: Icons.grid_3x3,
                isHorizontal: true,
              ),
              SizedBox(width: 12),
              ChapterCard(
                title: 'Mole Concept',
                icon: Icons.calculate,
                isHorizontal: true,
              ),
              SizedBox(width: 12),
              ChapterCard(
                title: 'Atomic Structure',
                icon: Icons.science,
                isHorizontal: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
