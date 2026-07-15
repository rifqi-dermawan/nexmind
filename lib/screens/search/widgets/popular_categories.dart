import 'package:flutter/material.dart';
import '../../../core/theme.dart';

class PopularCategories extends StatelessWidget {
  const PopularCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Popular Categories',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _buildCategoryCard(
              context: context,
              icon: Icons.menu_book,
              iconBgColor: AppColors.primary,
              title: 'Study',
              subtitle: '12 Active',
            ),
            _buildCategoryCard(
              context: context,
              icon: Icons.school,
              iconBgColor: AppColors.primary,
              title: 'Exams',
              subtitle: '3 Upcoming',
            ),
            _buildCategoryCard(
              context: context,
              icon: Icons.architecture,
              iconBgColor: const Color(0xFF4AC2F6), // Light blue from image
              title: 'Projects',
              subtitle: '5 Tasks',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryCard({
    required BuildContext context,
    required IconData icon,
    required Color iconBgColor,
    required String title,
    required String subtitle,
  }) {
    // Determine card width based on screen size minus padding and spacing
    final cardWidth = (MediaQuery.of(context).size.width - 48 - 16) / 2;

    return Container(
      width: cardWidth,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFBF4EA),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.textBrown, size: 24),
          ),
          const SizedBox(height: 32),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textLight,
            ),
          ),
        ],
      ),
    );
  }
}
