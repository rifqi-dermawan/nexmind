import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'admin_settings_menu_item.dart';

class AdminSystemSection extends StatelessWidget {
  const AdminSystemSection({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 4),
            child: Text(
              'System',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
          ),
          AdminSettingsMenuItem(
            icon: Icons.notifications_none,
            title: 'Notifications',
            onTap: () {},
          ),
          AdminSettingsMenuItem(
            icon: Icons.gpp_good_outlined,
            title: 'System Security',
            onTap: () {},
          ),
          AdminSettingsMenuItem(
            icon: Icons.build_outlined,
            title: 'Maintenance',
            showBorder: false,
            onTap: () {
              context.push('/admin_maintenance');
            },
          ),
        ],
      ),
    );
  }
}
