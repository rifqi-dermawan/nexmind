import 'package:flutter/material.dart';
import '../../core/theme.dart';
import 'edit_task.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPriorityTag(),
            const SizedBox(height: 16),
            const Text(
              'Membuat Prototype\nAplikasi',
              style: TextStyle(
                fontSize: 28, 
                fontWeight: FontWeight.bold, 
                height: 1.2, 
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 12),
            _buildTimeAndDate(),
            const SizedBox(height: 32),
            _buildSectionTitle('DESCRIPTION'),
            const SizedBox(height: 12),
            _buildDescriptionCard(),
            const SizedBox(height: 32),
            _buildSectionTitle('SUBTASKS'),
            const SizedBox(height: 16),
            _buildSubtaskList(),
            const SizedBox(height: 32),
            _buildSectionTitle('ATTACHMENTS'),
            const SizedBox(height: 16),
            _buildAttachments(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _buildCompleteButton(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.edit_outlined, color: AppColors.textBrown), 
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const EditTaskScreen()));
          },
        ),
        IconButton(
          icon: const Icon(Icons.delete_outline, color: Colors.red), 
          onPressed: () {},
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildPriorityTag() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFFFEBEB), 
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.circle, color: Colors.red, size: 8),
          SizedBox(width: 6),
          Text(
            'High Priority', 
            style: TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeAndDate() {
    return Row(
      children: const [
        Icon(Icons.access_time, color: AppColors.textBrown, size: 18),
        SizedBox(width: 8),
        Text('Today, 10:00', style: TextStyle(color: AppColors.textBrown, fontSize: 14)),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 12, 
        fontWeight: FontWeight.bold, 
        color: AppColors.textLight, 
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildDescriptionCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        'Buat prototype interaktif untuk aplikasi StudyMate menggunakan Figma. Pastikan semua flow utama ter-cover, termasuk onboarding, task management, dan profile. Referensi desain bisa dilihat di folder project.',
        style: TextStyle(color: AppColors.textDark, height: 1.6, fontSize: 14),
      ),
    );
  }

  Widget _buildSubtaskList() {
    return Column(
      children: [
        _buildSubtaskItem('Wireframing', true),
        _buildSubtaskItem('High-fidelity Design', false),
        _buildSubtaskItem('Interactive Prototyping', false),
      ],
    );
  }

  Widget _buildSubtaskItem(String title, bool isDone) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDone ? AppColors.primary : Colors.transparent,
              border: Border.all(
                color: isDone ? AppColors.primary : Colors.grey.shade400, 
                width: 2,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              color: isDone ? Colors.grey : AppColors.textDark,
              decoration: isDone ? TextDecoration.lineThrough : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttachments() {
    return Row(
      children: [
        _buildAttachmentThumb('UI_Ref_v2.png', isImage: true),
        const SizedBox(width: 16),
        _buildAttachmentThumb('Brief_Doc.pdf', isImage: false),
      ],
    );
  }

  Widget _buildAttachmentThumb(String title, {required bool isImage}) {
    return Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        color: isImage ? Colors.grey.shade400 : const Color(0xFFFDF7F0),
        borderRadius: BorderRadius.circular(20),
        border: isImage ? null : Border.all(
          color: const Color(0xFFE2D1C3), 
          width: 1.5,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (isImage)
            const Icon(Icons.image, color: Colors.white, size: 40)
          else
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: AppColors.primary, 
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.insert_drive_file, color: AppColors.textBrown, size: 24),
                ),
                const SizedBox(height: 12),
                Text(
                  title, 
                  style: const TextStyle(fontSize: 10, color: AppColors.textBrown, fontWeight: FontWeight.w600), 
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          if (isImage)
            Positioned(
              bottom: 12,
              left: 12,
              child: Text(
                title, 
                style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold, shadows: [Shadow(blurRadius: 4, color: Colors.black)]),
              ),
            )
        ],
      ),
    );
  }

  Widget _buildCompleteButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          elevation: 6,
          shadowColor: AppColors.primary.withOpacity(0.5),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.check_circle_outline, color: AppColors.textBrown),
            SizedBox(width: 8),
            Text(
              'Mark as Complete',
              style: TextStyle(color: AppColors.textBrown, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
