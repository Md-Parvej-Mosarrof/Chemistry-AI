import 'package:flutter/material.dart';

class HomeCategoryGrid extends StatelessWidget {
  const HomeCategoryGrid({super.key});

  static const List<_Category> _categories = [
    _Category('Organic', Icons.eco, Color(0xFF4CAF50)),
    _Category('Inorganic', Icons.science, Color(0xFF2196F3)),
    _Category('Physical', Icons.bolt, Color(0xFFFF9800)),
    _Category('Analytical', Icons.analytics, Color(0xFF9C27B0)),
    _Category('Biochemistry', Icons.biotech, Color(0xFF009688)),
    _Category('Lab', Icons.science_outlined, Color(0xFFF44336)),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 14),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _categories.length,

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,

            crossAxisSpacing: 14,
            mainAxisSpacing: 14,

            // Perfect height
            childAspectRatio: 1.8,
          ),

          itemBuilder: (context, index) {
            final category = _categories[index];

            return InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: () {},

              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),

                  border: Border.all(
                    color: Colors.grey.shade200,
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .04),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 44,
                      width: 44,

                      decoration: BoxDecoration(
                        color: category.color.withValues(alpha: .12),
                        shape: BoxShape.circle,
                      ),

                      child: Icon(
                        category.icon,
                        color: category.color,
                        size: 22,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      category.title,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
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

class _Category {
  final String title;
  final IconData icon;
  final Color color;

  const _Category(
    this.title,
    this.icon,
    this.color,
  );
}