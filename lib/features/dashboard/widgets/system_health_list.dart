import 'package:flutter/material.dart';

class SystemHealthList extends StatelessWidget {
  const SystemHealthList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'System Health',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          Container(
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
            child: const Column(
              children: [
                _HealthItem(name: 'API', detail: '120ms', statusPercent: '99.99%', isHealthy: true),
                _HealthItem(name: 'Conversion Svc', detail: '350ms', statusPercent: '99.95%', isHealthy: true),
                _HealthItem(name: 'Notification Svc', detail: '45ms', statusPercent: '98.50%', isWarning: true),
                _HealthItem(name: 'Database', detail: '15ms', statusPercent: '99.99%', isHealthy: true),
                _HealthItem(name: 'Storage', detail: '85% Used', statusPercent: 'Warning', isDanger: true, isLast: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HealthItem extends StatelessWidget {
  final String name;
  final String detail;
  final String statusPercent;
  final bool isHealthy;
  final bool isWarning;
  final bool isDanger;
  final bool isLast;

  const _HealthItem({
    required this.name,
    required this.detail,
    required this.statusPercent,
    this.isHealthy = false,
    this.isWarning = false,
    this.isDanger = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    Color getStatusColor() {
      if (isHealthy) return Colors.green;
      if (isWarning) return const Color(0xFFFFD54F); // Yellow
      if (isDanger) return Colors.red;
      return Colors.grey;
    }

    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              name,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              detail,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).textTheme.bodySmall?.color?.withValues(alpha: 0.6),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: getStatusColor(),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  statusPercent,
                  style: TextStyle(
                    fontSize: 10,
                    color: getStatusColor(),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
