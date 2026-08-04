import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'admin_settings_menu_item.dart';

class AdminSupportSection extends StatelessWidget {
  const AdminSupportSection({super.key});

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
          AdminSettingsMenuItem(
            icon: Icons.help_outline,
            title: 'Help & Support',
            onTap: () {
              context.push('/admin_support');
            },
          ),
          AdminSettingsMenuItem(
            icon: Icons.info_outline,
            title: 'About Nexmind',
            showBorder: false,
            onTap: () {
              context.push('/admin_about');
            },
          ),
        ],
      ),
    );
  }
}
