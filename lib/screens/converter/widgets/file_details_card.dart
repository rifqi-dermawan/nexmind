import 'package:flutter/material.dart';
import '../../../core/theme.dart';

class FileDetailsCard extends StatelessWidget {
  final String name;
  final String size;
  final String format;

  const FileDetailsCard({
    super.key,
    required this.name,
    required this.size,
    required this.format,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFFCF8F2),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'File Details',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 24),
          _buildDetailRow(Icons.description_outlined, 'Name', name),
          const Divider(height: 32, color: Colors.black12),
          _buildDetailRow(Icons.sd_storage_outlined, 'Size', size),
          const Divider(height: 32, color: Colors.black12),
          _buildDetailRow(
            Icons.folder_open_outlined,
            'Format',
            format,
            isFormat: true,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value, {bool isFormat = false}) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.textDark),
        const SizedBox(width: 12),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textDark,
            fontSize: 16,
          ),
        ),
        const Spacer(),
        if (isFormat)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFB3E5FC), // Light blue
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              value,
              style: const TextStyle(
                color: Color(0xFF0277BD),
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        else
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
                fontSize: 14,
              ),
            ),
          ),
      ],
    );
  }
}
