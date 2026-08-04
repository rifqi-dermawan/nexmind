import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/admin_bottom_nav_bar.dart';
import 'widgets/admin_notification_card.dart';
import '../../core/theme/theme_provider.dart';

class AdminNotificationsScreen extends StatelessWidget {
  const AdminNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Theme.of(context).iconTheme.color, size: 20),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Notifications',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              if (isDarkMode) {
                ThemeProvider.changeTheme(ThemeMode.light);
              } else {
                ThemeProvider.changeTheme(ThemeMode.dark);
              }
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: const [
          AdminNotificationCard(
            title: 'System Update Available',
            body: 'Nexmind v2.4 is ready to install. Please review the release notes and schedule a maintenance window.',
            timeAgo: '2m ago',
            icon: Icons.info_outline,
            isUnread: true,
          ),
          AdminNotificationCard(
            title: 'New User Registration',
            body: 'Sarah Jenkins (sarah.j@example.com) has requested access to the marketing dashboard.',
            timeAgo: '15m ago',
            icon: Icons.person_add_outlined,
            isUnread: true,
          ),
          AdminNotificationCard(
            title: 'Data Export Complete',
            body: 'Your requested export \'Q3_Performance_Metrics.csv\' is ready to download.',
            timeAgo: '1h ago',
            icon: Icons.check_circle_outline,
            isUnread: false,
          ),
          AdminNotificationCard(
            title: 'API Rate Limit Warning',
            body: 'You have reached 80% of your hourly API quota. Consider upgrading your plan if this persists.',
            timeAgo: '3h ago',
            icon: Icons.warning_amber_rounded,
            iconColor: Colors.red,
            isUnread: false,
          ),
          AdminNotificationCard(
            title: 'Payment Successful',
            body: 'Invoice #INV-2023-089 has been paid successfully using ending in *4242.',
            timeAgo: 'Yesterday',
            icon: Icons.attach_money,
            isUnread: false,
          ),
        ],
      ),
      bottomNavigationBar: AdminBottomNavBar(
        selectedIndex: 0,
        onItemTapped: (index) {
          if (index == 0) {
            context.go('/admin'); // Use go to pop back to dashboard
          } else if (index == 1) {
            context.push('/admin_users');
          } else if (index == 2) {
            context.push('/admin_conversions');
          }
        },
      ),
    );
  }
}
