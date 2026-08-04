import 'package:flutter/material.dart';

class SystemStatusCard extends StatelessWidget {
  const SystemStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 12),
          child: Text(
            'System Status',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
        ),
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
              _buildStatusRow(context, 'System Status', 'Operational', true),
              _buildStatusRow(context, 'API Status', 'Operational', true),
              _buildStatusRow(context, 'Conversion Service', 'Degraded', false),
              _buildStatusRow(context, 'Notification Service', 'Operational', true),
              _buildStatusRow(context, 'Database Status', 'Operational', true, showBorder: false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatusRow(
    BuildContext context, 
    String title, 
    String status, 
    bool isOperational, 
    {bool showBorder = true}
  ) {
    final statusColor = isOperational ? const Color(0xFF10B981) : const Color(0xFFF59E0B); // Green or Amber
    final statusIcon = isOperational ? Icons.check_circle_outline : Icons.warning_amber_rounded;

    return Container(
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
          Row(
            children: [
              Text(
                status,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: statusColor,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                statusIcon,
                size: 18,
                color: statusColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
