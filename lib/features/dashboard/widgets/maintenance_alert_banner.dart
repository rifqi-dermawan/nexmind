import 'package:flutter/material.dart';

class MaintenanceAlertBanner extends StatelessWidget {
  const MaintenanceAlertBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7E6), // Light yellow tint
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFFFD580)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.info_outline,
            color: Color(0xFFB8860B), // Darker yellow/brown
            size: 20,
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'System maintenance scheduled for\nOct 24, 02:00 UTC',
              style: TextStyle(
                color: Color(0xFF8B6508),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, size: 16, color: Color(0xFF8B6508)),
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          )
        ],
      ),
    );
  }
}
