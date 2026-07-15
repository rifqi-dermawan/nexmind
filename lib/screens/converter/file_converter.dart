import 'package:flutter/material.dart';
import '../../core/theme.dart';
import 'widgets/quota_card.dart';
import 'widgets/conversion_option_card.dart';
import 'storage_permission_screen.dart';
import 'conversion_history.dart';

class FileConverterScreen extends StatelessWidget {
  const FileConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dashboardTopBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false, // For bottom nav screens
        title: const Text(
          'Converter',
          style: TextStyle(
            color: AppColors.textBrown,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: AppColors.textBrown),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 120), // Bottom padding for nav bar
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const QuotaCard(),
            const SizedBox(height: 32),
            const Text(
              'Pilih Jenis Konversi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 16),
            ConversionOptionCard(
              iconWidget: const Text(
                'W',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
              ),
              iconBackgroundColor: const Color(0xFF28C7FA), // Light Blue
              title: 'PDF \u2192 Word',
              subtitle: 'Ubah PDF ke .docx',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StoragePermissionScreen(),
                  ),
                );
              },
            ),
            ConversionOptionCard(
              iconWidget: const Text(
                'PDF',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              iconBackgroundColor: const Color(0xFFFF5C77), // Light Red
              title: 'Word \u2192 PDF',
              subtitle: 'Ubah .docx ke PDF',
              onTap: () {},
            ),
            ConversionOptionCard(
              iconWidget: const Icon(Icons.image_outlined, color: Colors.white, size: 28),
              iconBackgroundColor: const Color(0xFFDF68E1), // Light Purple
              title: 'Image \u2192 PDF',
              subtitle: 'Ubah gambar ke PDF',
              onTap: () {},
            ),
            ConversionOptionCard(
              iconWidget: const Icon(Icons.compress, color: Colors.white, size: 28),
              iconBackgroundColor: const Color(0xFF32F1A0), // Light Green
              title: 'Compress PDF',
              subtitle: 'Kecilkan ukuran PDF',
              onTap: () {},
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ConversionHistoryScreen(),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.textBrown,
                  side: BorderSide(color: AppColors.textBrown.withOpacity(0.3)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Lihat Semua',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
