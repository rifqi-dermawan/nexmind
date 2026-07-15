import 'package:flutter/material.dart';
import 'widgets/task_input_card.dart';
import 'widgets/category_priority_card.dart';
import 'widgets/date_time_card.dart';
import 'widgets/settings_attachment_card.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF8F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: CircleAvatar(
            backgroundColor: const Color(0xFFFAEDE1),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black87),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        title: const Text(
          'New Task',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6B4E0F),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TaskInputCard(
              titleController: _titleController,
              descriptionController: _descriptionController,
            ),
            const SizedBox(height: 24),
            const CategoryPriorityCard(),
            const SizedBox(height: 24),
            const DateTimeCard(),
            const SizedBox(height: 24),
            const SettingsAttachmentCard(),
            const SizedBox(height: 100), // padding for floating button
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton.icon(
            onPressed: () {
              // Save Task Logic
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.check_circle_outline, color: Color(0xFF6B4E0F), size: 20),
            label: const Text(
              'Save Task',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6B4E0F),
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF1B000),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              elevation: 4,
            ),
          ),
        ),
      ),
    );
  }
}
