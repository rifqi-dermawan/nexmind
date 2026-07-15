import 'package:flutter/material.dart';
import '../../core/theme.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({super.key});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  // Data statis untuk keperluan UI (Mock Data)
  final TextEditingController _titleController = 
      TextEditingController(text: 'Complete UX Research Report');
  final TextEditingController _descController = TextEditingController(
      text: 'Compile notes from user interviews and create persona drafts for the new academic app feature.');

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel('Task Title'),
            _buildTextField(_titleController),
            const SizedBox(height: 24),
            _buildLabel('Description'),
            _buildTextField(_descController, maxLines: 4),
            const SizedBox(height: 24),
            _buildLabel('Due Date'),
            _buildDropdownField(
                icon: Icons.calendar_today_outlined, 
                text: '11/15/2023', 
                trailingIcon: Icons.calendar_month),
            const SizedBox(height: 24),
            _buildLabel('Priority'),
            _buildDropdownField(
                icon: Icons.outlined_flag, 
                text: 'High', 
                trailingIcon: Icons.keyboard_arrow_down),
            const SizedBox(height: 24),
            _buildLabel('Category'),
            _buildCategorySelector(),
            const SizedBox(height: 32),
            const Divider(color: Color(0xFFE2D1C3), thickness: 0.5),
            const SizedBox(height: 24),
            _buildActionButtons(context),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 70,
      leading: Padding(
        padding: const EdgeInsets.only(left: 24.0, top: 8, bottom: 8),
        child: InkWell(
          onTap: () => Navigator.pop(context),
          borderRadius: BorderRadius.circular(24),
          child: Container(
            decoration: const BoxDecoration(color: Color(0xFFF3E9DD), shape: BoxShape.circle),
            child: const Icon(Icons.arrow_back, color: AppColors.textDark, size: 20),
          ),
        ),
      ),
      title: const Text(
        'Edit Task',
        style: TextStyle(color: AppColors.textBrown, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textBrown),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, {int maxLines = 1}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5EBE1), // Light beige box
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        style: const TextStyle(color: AppColors.textDark, fontSize: 16),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          border: InputBorder.none,
          isDense: true,
        ),
      ),
    );
  }

  Widget _buildDropdownField({required IconData icon, required String text, required IconData trailingIcon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5EBE1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.textBrown, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(text, style: const TextStyle(color: AppColors.textDark, fontSize: 16)),
          ),
          Icon(trailingIcon, color: AppColors.textBrown, size: 22),
        ],
      ),
    );
  }

  Widget _buildCategorySelector() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildCategoryPill('Personal', isSelected: false),
          const SizedBox(width: 8),
          _buildCategoryPill('Study', isSelected: true, color: const Color(0xFF33C9FF)),
          const SizedBox(width: 8),
          _buildCategoryPill('Work', isSelected: false),
          const SizedBox(width: 8),
          _buildNewCategoryPill(),
        ],
      ),
    );
  }

  Widget _buildCategoryPill(String text, {required bool isSelected, Color? color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? color : const Color(0xFFE8DCC8).withOpacity(0.5),
        borderRadius: BorderRadius.circular(24),
        border: isSelected ? null : Border.all(color: const Color(0xFFD5C4B1), width: 1),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : AppColors.textBrown,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildNewCategoryPill() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF7F0), // Lebih terang agar mirip dashed box
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFD5C4B1), width: 1), 
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.add, size: 16, color: AppColors.textBrown),
          SizedBox(width: 4),
          Text('New', style: TextStyle(color: AppColors.textBrown, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
              elevation: 2,
            ),
            onPressed: () {
              Navigator.pop(context); // Kembali ke task_detail
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.save_outlined, color: AppColors.textBrown),
                SizedBox(width: 8),
                Text(
                  'Save Changes', 
                  style: TextStyle(color: AppColors.textBrown, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 56,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFFD32F2F), width: 1.2),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
              backgroundColor: const Color(0xFFFFF0F0), // Latar merah super pudar
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.delete_outline, color: Color(0xFFD32F2F)),
                SizedBox(width: 8),
                Text(
                  'Delete Task', 
                  style: TextStyle(color: Color(0xFFD32F2F), fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
