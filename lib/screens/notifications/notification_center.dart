import 'package:flutter/material.dart';
import '../../core/theme.dart';
import 'widgets/notification_card.dart';

class NotificationCenter extends StatelessWidget {
  const NotificationCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textBrown),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: AppColors.textBrown,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_all, color: AppColors.textBrown),
            onPressed: () {
              // Mark all as read action
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text(
            'TODAY',
            style: TextStyle(
              color: AppColors.textLight,
              fontWeight: FontWeight.w600,
              fontSize: 12,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          const NotificationCard(
            icon: Icons.assignment_outlined,
            iconBackgroundColor: Color(0xFF33CCFF),
            iconColor: Colors.white,
            title: 'Task Reminder: Cal...',
            time: '2m ago',
            description: 'Your assignment is due in 2 hours. Don\'t forget to submit!',
            isUnread: true,
          ),
          NotificationCard(
            icon: Icons.swap_horiz,
            iconBackgroundColor: AppColors.primary,
            iconColor: Colors.white,
            title: 'Conversion Ready: ...',
            time: '1h ago',
            description: 'Your document has been successfully converted to Word...',
            isUnread: true,
            buttonText: 'Download',
            onButtonTap: () {
              // Download action
            },
          ),
          const SizedBox(height: 16),
          const Text(
            'YESTERDAY',
            style: TextStyle(
              color: AppColors.textLight,
              fontWeight: FontWeight.w600,
              fontSize: 12,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          const NotificationCard(
            icon: Icons.local_fire_department_outlined,
            iconBackgroundColor: Color(0xFFEBE3D5),
            iconColor: AppColors.textBrown,
            title: 'Streak Update: 5 Days!',
            time: 'Yesterday',
            description: 'You\'re on fire! Keep up the great work learning every day.',
          ),
          const NotificationCard(
            icon: Icons.notifications_none_outlined,
            iconBackgroundColor: Color(0xFFEBE3D5),
            iconColor: AppColors.textBrown,
            title: 'System Update',
            time: 'Yesterday',
            description: 'New features have been added to your dashboard.',
          ),
        ],
      ),
    );
  }
}
