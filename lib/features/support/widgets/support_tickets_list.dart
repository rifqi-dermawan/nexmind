import 'package:flutter/material.dart';
import 'support_ticket_item.dart';

class SupportTicketsList extends StatelessWidget {
  const SupportTicketsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 12, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Support Tickets',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
              Text(
                'View All',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF59E0B),
                ),
              ),
            ],
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
            children: const [
              SupportTicketItem(
                ticketId: '#TK-1024',
                title: 'API Rate Limit Issue',
                priority: 'HIGH',
                status: 'IN PROGRESS',
                userName: 'Alice Johnson',
                timeAgo: '2h ago',
                avatarUrl: 'assets/images/avatar.png',
              ),
              SupportTicketItem(
                ticketId: '#TK-1023',
                title: 'Dashboard Data Missing',
                priority: 'LOW',
                status: 'RESOLVED',
                userName: 'Mark Smith',
                timeAgo: '1d ago',
                avatarUrl: 'assets/images/avatar2.png',
              ),
              SupportTicketItem(
                ticketId: '#TK-1021',
                title: 'Billing Address Update Failed',
                priority: 'MEDIUM',
                status: 'OPEN',
                userName: 'Sarah Jones',
                timeAgo: '2d ago',
                showBorder: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
