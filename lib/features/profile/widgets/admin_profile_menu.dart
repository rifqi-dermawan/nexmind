import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminProfileMenu extends StatelessWidget {
  const AdminProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 3 Menu Items Card
        Container(
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
              _buildMenuItem(context, Icons.person_outline, 'Edit Profile', () {}),
              _buildMenuItem(context, Icons.lock_outline, 'Change Password', () {}),
              _buildMenuItem(context, Icons.shield_outlined, 'Security', () {}, showBorder: false),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Logout Card
        Container(
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
          child: _buildMenuItem(
            context, 
            Icons.logout, 
            'Logout', 
            () {
              context.go('/admin_login');
            }, 
            isDestructive: true, 
            showBorder: false
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(
    BuildContext context, 
    IconData icon, 
    String title, 
    VoidCallback onTap, 
    {bool isDestructive = false, bool showBorder = true}
  ) {
    final textColor = isDestructive ? Colors.red : Theme.of(context).textTheme.bodyLarge?.color;
    final iconColor = isDestructive ? Colors.red : Theme.of(context).iconTheme.color?.withValues(alpha: 0.7);
    final bgColor = isDestructive 
        ? Colors.red.withValues(alpha: 0.1) 
        : Theme.of(context).dividerColor.withValues(alpha: 0.3);

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          border: showBorder
              ? Border(
                  bottom: BorderSide(
                    color: Theme.of(context).dividerColor.withValues(alpha: 0.5),
                    width: 1,
                  ),
                )
              : null,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: bgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 20, color: iconColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
            ),
            if (!isDestructive)
              Icon(
                Icons.chevron_right,
                size: 20,
                color: Theme.of(context).iconTheme.color?.withValues(alpha: 0.4),
              ),
          ],
        ),
      ),
    );
  }
}
