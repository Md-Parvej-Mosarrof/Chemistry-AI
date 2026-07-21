import 'package:flutter/material.dart';

class HomeFeaturedChapters extends StatelessWidget {
  const HomeFeaturedChapters({Key? key}) : super(key: key);

  static const List<_ChapterItem> _chapters = [
    _ChapterItem(
      id: '1',
      title: 'Atomic Structure',
      category: 'Fundamental',
      progress: 0.75,
    ),
    _ChapterItem(
      id: '2',
      title: 'Bonding & Structure',
      category: 'Organic',
      progress: 0.60,
    ),
    _ChapterItem(
      id: '3',
      title: 'Thermodynamics',
      category: 'Physical',
      progress: 0.85,
    ),
    _ChapterItem(
      id: '4',
      title: 'Redox Reactions',
      category: 'Inorganic',
      progress: 0.50,
    ),
    _ChapterItem(
      id: '5',
      title: 'Equilibrium',
      category: 'Physical',
      progress: 0.70,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Featured Chapters',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _chapters.length,
            itemBuilder: (context, index) {
              final chapter = _chapters[index];
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 0 : 8,
                  right: 8,
                ),
                child: _FeaturedChapterCard(chapter: chapter),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _FeaturedChapterCard extends StatelessWidget {
  final _ChapterItem chapter;

  const _FeaturedChapterCard({required this.chapter});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SizedBox(
      width: 280,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: () {
            // Navigation handled by parent
          },
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colorScheme.primary.withOpacity(0.6),
                      colorScheme.secondary.withOpacity(0.4),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'Featured',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          chapter.title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chapter.category,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: chapter.progress,
                            minHeight: 6,
                            backgroundColor: Colors.white24,
                            valueColor: AlwaysStoppedAnimation(
                              colorScheme.tertiary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChapterItem {
  final String id;
  final String title;
  final String category;
  final double progress;

  const _ChapterItem({
    required this.id,
    required this.title,
    required this.category,
    required this.progress,
  });
}
