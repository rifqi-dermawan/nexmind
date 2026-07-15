import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../../widgets/custom_bottom_nav.dart';
import '../main/main_screen.dart';
import 'widgets/history_card.dart';

class ConversionHistoryScreen extends StatelessWidget {
  const ConversionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFFFDF7E8), // Based on mockup background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(Icons.person, color: AppColors.textBrown),
          ),
        ),
        title: const Text(
          'History',
          style: TextStyle(
            color: AppColors.textBrown,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: AppColors.textBrown),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF3EAD3), // Light beige
                borderRadius: BorderRadius.circular(24),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search history...',
                  hintStyle: TextStyle(color: AppColors.textBrown),
                  prefixIcon: Icon(Icons.search, color: AppColors.textBrown),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
              ),
            ),
            const SizedBox(height: 32),
            
            // TODAY
            const Text(
              'TODAY',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: AppColors.textBrown,
              ),
            ),
            const SizedBox(height: 16),
            HistoryCard(
              iconWidget: const Icon(Icons.picture_as_pdf_outlined, color: Color(0xFFC62828)), // Dark red
              iconBackgroundColor: const Color(0xFFFFCDD2), // Light red
              title: 'Annual_Report.pdf',
              subtitle: 'Word to PDF \u2022 10:42 AM',
              onDownload: () {},
              onDelete: () {},
            ),
            HistoryCard(
              iconWidget: const Icon(Icons.description, color: Colors.white),
              iconBackgroundColor: const Color(0xFF29B6F6), // Light blue
              title: 'Meeting_Notes.docx',
              subtitle: 'PDF to Word \u2022 09:15 AM',
              onDownload: () {},
              onDelete: () {},
            ),
            const SizedBox(height: 24),
            
            // YESTERDAY
            const Text(
              'YESTERDAY',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: AppColors.textBrown,
              ),
            ),
            const SizedBox(height: 16),
            HistoryCard(
              iconWidget: const Icon(Icons.image_outlined, color: AppColors.textBrown),
              iconBackgroundColor: const Color(0xFFFFCA28), // Yellow
              title: 'Presentation_Slide.png',
              subtitle: 'PDF to Image \u2022 4:30 PM',
              onDownload: () {},
              onDelete: () {},
            ),
            const SizedBox(height: 120), // Bottom padding for nav bar if accessed in main stack
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: 2, // Converter tab
        onItemTapped: (index) {
          if (index != 2) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => MainScreen(initialIndex: index),
              ),
              (route) => false,
            );
          } else {
            Navigator.pop(context); // Go back to Converter main screen
          }
        },
      ),
    );
  }
}
