import 'package:flutter/material.dart';
import '../../widgets/admin_bottom_nav_bar.dart';
import 'widgets/dashboard_app_bar.dart';
import 'widgets/welcome_admin_banner.dart';
import 'widgets/total_conversions_banner.dart';
import 'widgets/dashboard_stats_grid.dart';
import 'widgets/conversion_overview_chart.dart';
import 'widgets/user_growth_chart.dart';
import 'widgets/conversion_status_donut.dart';
import 'widgets/recent_activity_list.dart';
import 'widgets/system_health_list.dart';
import 'widgets/top_active_users_list.dart';
import 'widgets/quick_actions_row.dart';

import 'package:go_router/go_router.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DashboardAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            WelcomeAdminBanner(),
            TotalConversionsBanner(),
            DashboardStatsGrid(),
            ConversionOverviewChart(),
            UserGrowthChart(),
            ConversionStatusDonut(),
            RecentActivityList(),
            SystemHealthList(),
            TopActiveUsersList(),
            QuickActionsRow(),
          ],
        ),
      ),
      bottomNavigationBar: AdminBottomNavBar(
        selectedIndex: 0,
        onItemTapped: (index) {
          if (index == 1) {
            context.push('/admin_users');
          } else if (index == 2) {
            context.push('/admin_conversions');
          } else if (index == 3) {
            context.push('/admin_settings');
          }
        },
      ),
    );
  }
}
