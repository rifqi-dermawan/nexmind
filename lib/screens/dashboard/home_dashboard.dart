import 'package:flutter/material.dart';
import '../../widgets/custom_bottom_nav.dart';
import '../tasks/task_list.dart';
import 'widgets/progress_card.dart';
import 'widgets/study_streak_card.dart';
import 'widgets/deadlines_list.dart';
import 'widgets/quick_actions.dart';
import 'widgets/dashboard_header.dart';
import 'widgets/dashboard_banner_card.dart';
import 'widgets/section_header.dart';
import '../../core/theme.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background color for the top portion
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 250,
            child: Container(
              color: AppColors.dashboardTopBackground,
            ),
          ),
          SafeArea(
            bottom: false, // Biarkan konten tembus ke area bawah navbar
            child: Column(
              children: [
                const DashboardHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0, bottom: 120.0), // Padding ekstra agar konten tidak tertutup permanen

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ProgressCard(),
                        const SizedBox(height: 16),
                        const StudyStreakCard(),
                        const SizedBox(height: 16),
                        const DashboardBannerCard(),
                        const SizedBox(height: 24),
                        const SectionHeader(title: 'Today\'s Deadlines', action: 'Lihat Semua'),
                        const SizedBox(height: 16),
                        const DeadlinesList(),
                        const SizedBox(height: 24),
                        const Text(
                          'Quick Actions',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark),
                        ),
                        const SizedBox(height: 16),
                        const QuickActions(),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
