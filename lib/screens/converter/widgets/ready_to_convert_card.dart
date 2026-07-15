import 'package:flutter/material.dart';
import '../../../core/theme.dart';

class ReadyToConvertCard extends StatelessWidget {
  final VoidCallback onConvert;

  const ReadyToConvertCard({
    super.key,
    required this.onConvert,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7E6), // Light orange/yellow tinted
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: const Color(0xFFFFE0B2)), // Slightly darker border
      ),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: const BoxDecoration(
              color: Color(0xFFF3EAD3), // Beige circle
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.swap_horiz,
              color: AppColors.textBrown,
              size: 32,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Ready to Convert?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Transform this document into an editable\nformat instantly.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textLight,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onConvert,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.textBrown,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Convert to DOCX',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward, size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
