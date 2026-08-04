import 'package:flutter/material.dart';

class SupportTicketItem extends StatelessWidget {
  final String ticketId;
  final String title;
  final String priority; // HIGH, MEDIUM, LOW
  final String status; // IN PROGRESS, RESOLVED, OPEN
  final String userName;
  final String timeAgo;
  final String? avatarUrl;
  final bool showBorder;

  const SupportTicketItem({
    super.key,
    required this.ticketId,
    required this.title,
    required this.priority,
    required this.status,
    required this.userName,
    required this.timeAgo,
    this.avatarUrl,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                ticketId,
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(width: 8),
              _buildTag(context, priority, _getPriorityColor(priority)),
              const SizedBox(width: 8),
              _buildTag(context, status, _getStatusColor(status)),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).textTheme.bodyLarge?.color,
              decoration: status == 'RESOLVED' ? TextDecoration.lineThrough : null,
              decorationColor: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.5),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: const Color(0xFFF59E0B),
                    backgroundImage: avatarUrl != null ? AssetImage(avatarUrl!) : null,
                    child: avatarUrl == null 
                        ? Text(
                            _getInitials(userName),
                            style: const TextStyle(fontSize: 10, color: Colors.white),
                          )
                        : null,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    userName,
                    style: TextStyle(
                      fontSize: 13,
                      color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
              Text(
                timeAgo,
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTag(BuildContext context, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark 
            ? color.withValues(alpha: 0.2) 
            : color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }

  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'HIGH':
        return Colors.red;
      case 'MEDIUM':
        return Colors.orange;
      case 'LOW':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'IN PROGRESS':
        return const Color(0xFFB78103);
      case 'RESOLVED':
        return Colors.grey;
      case 'OPEN':
        return Colors.grey.shade600;
      default:
        return Colors.grey;
    }
  }

  String _getInitials(String name) {
    final parts = name.split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}';
    } else if (parts.isNotEmpty) {
      return parts[0][0];
    }
    return '?';
  }
}
