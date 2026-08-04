import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'admin_settings_menu_item.dart';

class AdminProfileSection extends StatelessWidget {
  const AdminProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Profile Info Header
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: const AssetImage('assets/images/avatar.png'),
                  onBackgroundImageError: (_, __) {},
                  child: const Icon(Icons.person, color: Colors.transparent),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Admin User',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'admin@nexmind.com',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).textTheme.bodySmall?.color?.withValues(alpha: 0.7),
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Menu Items
          AdminSettingsMenuItem(
            icon: Icons.person_outline,
            title: 'Edit Profile',
            onTap: () {
              context.push('/admin_profile');
            },
          ),
          AdminSettingsMenuItem(
            icon: Icons.lock_outline,
            title: 'Change Password',
            onTap: () {},
          ),
          AdminSettingsMenuItem(
            icon: Icons.shield_outlined,
            title: 'Security',
            onTap: () {},
          ),
          AdminSettingsMenuItem(
            icon: Icons.logout,
            title: 'Logout',
            isDestructive: true,
            showBorder: false,
            onTap: () {
              context.go('/admin_login');
            },
          ),
        ],
      ),
    );
  }
}
