import 'package:flutter/material.dart';

class DashboardStatsGrid extends StatelessWidget {
  const DashboardStatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(
                child: _StatCard(
                  title: 'Total\nUsers',
                  value: '12,480',
                  icon: Icons.people_outline,
                  percentage: '+8.4%',
                  isPositive: true,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _StatCard(
                  title: 'Active\nUsers',
                  value: '3.8k',
                  icon: Icons.person_outline,
                  percentage: '+5.4%',
                  isPositive: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              Expanded(
                child: _StatCard(
                  title: 'Successful',
                  value: '18.4k',
                  icon: Icons.check_circle_outline,
                  percentage: '+2.1%',
                  isPositive: true,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _StatCard(
                  title: 'Pending',
                  value: '850',
                  icon: Icons.pending_outlined,
                  percentage: '- 0.0%',
                  isPositive: null, // Neutral
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              Expanded(
                child: _StatCard(
                  title: 'Failed',
                  value: '250',
                  icon: Icons.error_outline,
                  percentage: '-1.2%',
                  isPositive: false,
                ),
              ),
              SizedBox(width: 16),
              Expanded(child: SizedBox()), // Empty space to keep it grid-like
            ],
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final String percentage;
  final bool? isPositive; 

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.percentage,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    Color getTextColor() {
      if (isPositive == true) return Colors.green;
      if (isPositive == false) return Colors.red;
      return Colors.grey.shade500;
    }

    IconData? getTrendIcon() {
      if (isPositive == true) return Icons.trending_up;
      if (isPositive == false) return Icons.trending_down;
      return Icons.remove;
    }

    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, size: 16, color: Theme.of(context).iconTheme.color?.withValues(alpha: 0.6)),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(getTrendIcon(), size: 12, color: getTextColor()),
                  const SizedBox(width: 2),
                  Text(
                    percentage,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: getTextColor(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
