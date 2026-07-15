import 'package:flutter/material.dart';

class FilterPills extends StatelessWidget {
  const FilterPills({super.key});

  @override
  Widget build(BuildContext context) {
    final filters = ['All', 'To-do', 'In Progress', 'Done'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: filters.map((f) {
          bool active = f == 'All';
          return Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            decoration: BoxDecoration(
              color: active ? const Color(0xFFF1B000) : Colors.transparent,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: active ? Colors.transparent : Colors.grey.shade300),
            ),
            child: Text(
              f,
              style: TextStyle(
                color: active ? const Color(0xFF6B4E0F) : Colors.black54,
                fontWeight: active ? FontWeight.bold : FontWeight.w600,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
