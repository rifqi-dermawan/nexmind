import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/admin_bottom_nav_bar.dart';
import '../../core/theme/theme_provider.dart';
import 'widgets/users_filter_chips.dart';
import 'widgets/admin_user_card.dart';

class AdminUsersScreen extends StatelessWidget {
  const AdminUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 80,
        leading: Row(
          children: [
            const SizedBox(width: 24),
            CircleAvatar(
              radius: 20,
              backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.2),
              child: const Icon(Icons.person, color: Colors.black54),
            ),
          ],
        ),
        title: Text(
          'Users',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Theme.of(context).iconTheme.color),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.filter_list, color: Theme.of(context).iconTheme.color),
            onPressed: () {},
          ),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.02),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search users...',
                    hintStyle: TextStyle(
                      color: Theme.of(context).textTheme.bodySmall?.color?.withValues(alpha: 0.5),
                    ),
                    prefixIcon: Icon(
                      Icons.search, 
                      color: Theme.of(context).iconTheme.color?.withValues(alpha: 0.5)
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  ),
                ),
              ),
            ),
            
            // Filter Chips
            const UsersFilterChips(),
            
            // User List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                children: const [
                  AdminUserCard(
                    name: 'Sarah Jenkins',
                    email: 'sarah.j@example.com',
                    status: 'Active',
                    date: 'Oct 12, 2023',
                  ),
                  AdminUserCard(
                    name: 'Michael Chen',
                    email: 'm.chen@example.com',
                    status: 'Inactive',
                    date: 'Nov 05, 2023',
                  ),
                  AdminUserCard(
                    name: 'Elena Rodriguez',
                    email: 'elena.r@example.com',
                    status: 'Active',
                    date: 'Jan 20, 2024',
                  ),
                  AdminUserCard(
                    name: 'David Kim',
                    email: 'd.kim@example.com',
                    status: 'Suspended',
                    date: 'Feb 14, 2024',
                  ),
                ],
              ),
            ),
            
            // Load More Button
            Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 32),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Load More',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Theme.of(context).iconTheme.color?.withValues(alpha: 0.5),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AdminBottomNavBar(
        selectedIndex: 1, // Index 1 is Users
        onItemTapped: (index) {
          if (index == 0) {
            context.go('/admin');
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
