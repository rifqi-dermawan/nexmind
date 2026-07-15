import 'package:flutter/material.dart';
import '../../../core/theme.dart';
import '../task_detail.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = [
      {'title': 'Membuat Prototype Aplikasi', 'time': 'Today, 10:00', 'active': false},
      {'title': 'Belajar UI/UX Design', 'time': 'Today, 13:00', 'active': false},
      {'title': 'Menyelesaikan Laporan', 'time': 'Tomorrow, 09:00', 'active': true},
      {'title': 'Persiapan Ujian Akhir', 'time': '24 Jun, 08:00', 'active': false},
      {'title': 'Revisi Paper Jurnal', 'time': '25 Jun, 14:00', 'active': false},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: tasks.length,
      itemBuilder: (ctx, i) {
        final t = tasks[i];
        bool isActive = t['active'] as bool;
        return GestureDetector(
          onTap: () {
            // Ketika item di-klik, arahkan ke halaman detail task
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TaskDetailScreen()),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: isActive ? AppColors.primary : Colors.transparent, width: isActive ? 1.5 : 0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Row(
              children: [
                Icon(
                  isActive ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                  color: isActive ? AppColors.primary : Colors.grey.shade300,
                  size: 28,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t['title'] as String,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        t['time'] as String,
                        style: const TextStyle(fontSize: 14, color: AppColors.textLight),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: AppColors.textDark),
              ],
            ),
          ),
        );
      },
    );
  }
}
