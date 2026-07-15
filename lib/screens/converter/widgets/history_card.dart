import 'package:flutter/material.dart';
import '../../../core/theme.dart';

class HistoryCard extends StatelessWidget {
  final Widget iconWidget;
  final Color iconBackgroundColor;
  final String title;
  final String subtitle;
  final VoidCallback onDownload;
  final VoidCallback onDelete;

  const HistoryCard({
    super.key,
    required this.iconWidget,
    required this.iconBackgroundColor,
    required this.title,
    required this.subtitle,
    required this.onDownload,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              shape: BoxShape.circle,
            ),
            child: Center(child: iconWidget),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textDark,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.file_download_outlined, color: AppColors.textDark),
            onPressed: onDownload,
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: AppColors.textDark),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
