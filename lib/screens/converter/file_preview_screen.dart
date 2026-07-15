import 'package:flutter/material.dart';
import '../../core/theme.dart';
import 'widgets/file_preview_card.dart';
import 'widgets/file_details_card.dart';
import 'widgets/ready_to_convert_card.dart';
import 'converter_progress_screen.dart';

class FilePreviewScreen extends StatelessWidget {
  const FilePreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF7E8), // Light yellowish background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFF3EAD3),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: const Text(
          'File Preview',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const FilePreviewCard(),
            const SizedBox(height: 24),
            const FileDetailsCard(
              name: 'Annual_Report_2024...',
              size: '2.4 MB',
              format: '.PDF',
            ),
            const SizedBox(height: 24),
            ReadyToConvertCard(
              onConvert: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ConverterProgressScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 24), // Bottom padding
          ],
        ),
      ),
    );
  }
}
