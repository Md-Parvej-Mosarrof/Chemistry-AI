import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_error_widget.dart';
import '../providers/home_notifier.dart';
import 'chapter_card.dart';
import '../../../../core/widgets/loading_skeleton.dart';

class FeaturedSection extends ConsumerWidget {
  const FeaturedSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeNotifierProvider);

    if (homeState.isLoading) {
      return const SizedBox(
        height: 180,
        child: LoadingSkeleton(),
      );
    }

    if (homeState.error != null) {
      return SizedBox(
        height: 180,
        child: AppErrorWidget(
          message: homeState.error!,
          onRetry: () {
            ref.read(homeNotifierProvider.notifier).retry();
          },
        ),
      );
    }

    final chapters = homeState.data;

    if (chapters.isEmpty) {
      return const SizedBox(
        height: 180,
        child: Center(
          child: Text("No chapters available"),
        ),
      );
    }

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
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: chapters.length,
            itemBuilder: (context, index) {
              final chapter = chapters[index];

              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: ChapterCard(
                  title: chapter.title,
                  icon: Icons.science,
                  isHorizontal: true,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}