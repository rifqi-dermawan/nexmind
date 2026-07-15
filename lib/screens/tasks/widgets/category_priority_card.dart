import 'package:flutter/material.dart';

class CategoryPriorityCard extends StatefulWidget {
  const CategoryPriorityCard({super.key});

  @override
  State<CategoryPriorityCard> createState() => _CategoryPriorityCardState();
}

class _CategoryPriorityCardState extends State<CategoryPriorityCard> {
  String _selectedCategory = 'Study';
  String _selectedPriority = 'Medium';

  final List<String> _categories = ['Study', 'Project', 'Exam', 'Personal'];
  final List<String> _priorities = ['Low', 'Medium', 'High'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Category',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _categories.map((category) {
              final isSelected = _selectedCategory == category;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedCategory = category;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected ? const Color(0xFF6B4E0F) : Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    category,
                    style: TextStyle(
                      fontSize: 13,
                      color: isSelected ? const Color(0xFF6B4E0F) : Colors.black87,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 32),
          const Text(
            'Priority',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 44, // Fixed height for the track
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFFFAEDE1),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Stack(
              children: [
                AnimatedAlign(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  alignment: _selectedPriority == 'Low'
                      ? Alignment.centerLeft
                      : _selectedPriority == 'Medium'
                          ? Alignment.center
                          : Alignment.centerRight,
                  child: FractionallySizedBox(
                    widthFactor: 1 / 3, // 3 options, so 1/3 width
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1B000),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: _priorities.map((priority) {
                    final isSelected = _selectedPriority == priority;
                    return Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          setState(() {
                            _selectedPriority = priority;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 200),
                            style: TextStyle(
                              fontSize: 13,
                              color: isSelected ? const Color(0xFF6B4E0F) : Colors.black54,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                            ),
                            child: Text(priority),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
