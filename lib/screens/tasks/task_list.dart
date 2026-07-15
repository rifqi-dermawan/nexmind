import 'package:flutter/material.dart';
import 'add_task_screen.dart';
import '../dashboard/home_dashboard.dart';
import '../../widgets/custom_bottom_nav.dart';
import 'widgets/filter_pills.dart';
import 'widgets/task_list_view.dart';
import '../../core/theme.dart';
import '../search/search_tasks_screen.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Tasks',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.textBrown,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.textDark),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const SearchTasksScreen()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list, color: AppColors.textDark),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const FilterPills(),
          const Expanded(child: TaskListView()),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 110.0),
        child: FloatingActionButton(
          backgroundColor: AppColors.primary,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const AddTaskScreen()));
          },
          elevation: 4,
          child: const Icon(Icons.add, color: AppColors.textBrown, size: 28),
        ),
      ),
    );
  }

}
