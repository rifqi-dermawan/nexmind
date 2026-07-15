import 'package:flutter/material.dart';
import '../../../core/theme.dart';

class SearchInputBar extends StatelessWidget {
  const SearchInputBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.primary, width: 2),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search tasks, subjects, or',
          hintStyle: const TextStyle(color: AppColors.textLight),
          prefixIcon: const Icon(Icons.search, color: AppColors.textBrown),
          suffixIcon: const Icon(Icons.mic_none, color: AppColors.textDark),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
      ),
    );
  }
}
