import 'package:flutter/material.dart';
import '../../../core/theme.dart';

class SearchEmptyState extends StatelessWidget {
  const SearchEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 40),
        Image.asset(
          'assets/images/loginregister.png',
          height: 180,
        ),
        const SizedBox(height: 24),
        const Text(
          'Find your tasks in seconds.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.textBrown,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Start typing above to search through all\nyour study materials, assignments, and\nnotes.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textLight,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 40),
      ],
      ),
    );
  }
}
