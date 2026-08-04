import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/admin_bottom_nav_bar.dart';
import '../../core/theme/theme_provider.dart';
import 'widgets/system_status_card.dart';
import 'widgets/maintenance_mode_card.dart';
import 'widgets/configuration_card.dart';

class AdminMaintenanceScreen extends StatelessWidget {
  const AdminMaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).iconTheme.color),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/admin_settings');
            }
          },
        ),
        title: Text(
          'Maintenance',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
        ),
        centerTitle: true,
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          children: const [
            SystemStatusCard(),
            SizedBox(height: 32),
            MaintenanceModeCard(),
            SizedBox(height: 32),
            ConfigurationCard(),
            SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: AdminBottomNavBar(
        selectedIndex: 3, // Settings/Maintenance is active
        onItemTapped: (index) {
          if (index == 0) {
            context.go('/admin');
          } else if (index == 1) {
            context.push('/admin_users');
          } else if (index == 2) {
            context.push('/admin_conversions');
          } else if (index == 3) {
            context.go('/admin_settings');
          }
        },
      ),
    );
  }
}
