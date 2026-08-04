import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/theme_provider.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.2),
                  child: const Icon(Icons.person, color: Colors.black54), // Placeholder for profile pic
                ),
                const SizedBox(width: 16),
                Text(
                  'Dashboard',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.notifications_none, color: Theme.of(context).iconTheme.color),
                  onPressed: () {
                    context.push('/admin_notifications');
                  },
                ),
                IconButton(
                  icon: Icon(isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined, color: Theme.of(context).iconTheme.color),
                  onPressed: () {
                    if (isDarkMode) {
                      ThemeProvider.changeTheme(ThemeMode.light);
                    } else {
                      ThemeProvider.changeTheme(ThemeMode.dark);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
