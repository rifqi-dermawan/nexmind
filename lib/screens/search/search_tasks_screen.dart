import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../../widgets/custom_bottom_nav.dart';
import '../main/main_screen.dart';
import '../dashboard/home_dashboard.dart';
import 'widgets/search_input_bar.dart';
import 'widgets/recent_searches.dart';
import 'widgets/popular_categories.dart';
import 'widgets/search_empty_state.dart';

class SearchTasksScreen extends StatefulWidget {
  const SearchTasksScreen({super.key});

  @override
  State<SearchTasksScreen> createState() => _SearchTasksScreenState();
}

class _SearchTasksScreenState extends State<SearchTasksScreen> {
  final int _selectedIndex = 1; // Index for Search

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Allows content to scroll under floating nav bar
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textBrown),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Search',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.textBrown,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        bottom: false, // Biarkan tembus sampai ke belakang navbar
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 8.0, bottom: 120.0), // Beri padding bawah agar konten tak tertutup
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SearchInputBar(),
                SizedBox(height: 32),
                RecentSearches(),
                SizedBox(height: 32),
                PopularCategories(),
                SizedBox(height: 32),
                SearchEmptyState(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex, // Menyorot Tasks karena ini bagian dari Tasks
        onItemTapped: (index) {
          // Navigasi kembali ke MainScreen di tab yang sesuai dan hapus tumpukan layar
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => MainScreen(initialIndex: index)),
            (route) => false,
          );
        },
      ),
    );
  }
}
