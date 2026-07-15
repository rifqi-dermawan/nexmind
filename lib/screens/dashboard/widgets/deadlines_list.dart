import 'package:flutter/material.dart';

class DeadlinesList extends StatelessWidget {
  const DeadlinesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildDeadlineItem(
          title: "Sistem Informasi Tugas",
          priority: "High Priority",
          priorityColor: const Color(0xFFD32F2F),
          time: "23:59",
          icon: Icons.access_time,
          iconBgColor: const Color(0xFFFFEBEE),
          iconColor: const Color(0xFFD32F2F),
          hasLeftBorder: false,
        ),
        const SizedBox(height: 12),
        _buildDeadlineItem(
          title: "Ujian Pemrograman Web",
          priority: "Medium Priority",
          priorityColor: const Color(0xFF8D6E63),
          time: "Besok 08:00",
          icon: Icons.assignment_outlined,
          iconBgColor: const Color(0xFFEFEBE9),
          iconColor: const Color(0xFF8D6E63),
          hasLeftBorder: true,
          borderColor: const Color(0xFFF1B000),
        ),
      ],
    );
  }

  Widget _buildDeadlineItem({
    required String title,
    required String priority,
    required Color priorityColor,
    required String time,
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required bool hasLeftBorder,
    Color? borderColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: hasLeftBorder
            ? Border(left: BorderSide(color: borderColor ?? Colors.transparent, width: 4))
            : Border.all(color: Colors.grey.shade100),
        boxShadow: hasLeftBorder
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                )
              ]
            : null,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  priority,
                  style: TextStyle(
                    fontSize: 12,
                    color: priorityColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
