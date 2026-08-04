import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuickActionsRow extends StatelessWidget {
  const QuickActionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Actions',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _ActionButton(
                  icon: Icons.person_add_alt_1, 
                  label: 'Manage Users',
                  onTap: () {
                    context.push('/admin_users');
                  },
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _ActionButton(
                  icon: Icons.search, 
                  label: 'View Conversions',
                  onTap: () {
                    context.push('/admin_conversions');
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              Expanded(
                child: _ActionButton(icon: Icons.analytics_outlined, label: 'View Analytics'),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _ActionButton(icon: Icons.build, label: 'System Maintenance'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const _ActionButton(
            icon: Icons.confirmation_number_outlined, 
            label: 'Support Tickets',
            isWide: true,
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isWide;

  final VoidCallback? onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    this.isWide = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: isWide 
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon, 
                  color: const Color(0xFFB8860B), // Darker yellow/brown as in design
                  size: 20,
                ),
                const SizedBox(width: 12),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.bodySmall?.color,
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Icon(
                  icon, 
                  color: const Color(0xFFB8860B),
                  size: 20,
                ),
                const SizedBox(height: 12),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.bodySmall?.color,
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
