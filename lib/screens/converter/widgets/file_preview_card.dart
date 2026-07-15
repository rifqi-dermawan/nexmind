import 'package:flutter/material.dart';
import '../../../core/theme.dart';

class FilePreviewCard extends StatelessWidget {
  const FilePreviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
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
      child: Column(
        children: [
          // Simulated Document
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(width: 120, height: 12, decoration: BoxDecoration(color: const Color(0xFFEBE1D0), borderRadius: BorderRadius.circular(6))),
                const SizedBox(height: 16),
                Container(width: double.infinity, height: 8, decoration: BoxDecoration(color: const Color(0xFFF3EAD3), borderRadius: BorderRadius.circular(4))),
                const SizedBox(height: 8),
                Container(width: double.infinity, height: 8, decoration: BoxDecoration(color: const Color(0xFFF3EAD3), borderRadius: BorderRadius.circular(4))),
                const SizedBox(height: 8),
                Container(width: 200, height: 8, decoration: BoxDecoration(color: const Color(0xFFF3EAD3), borderRadius: BorderRadius.circular(4))),
                const SizedBox(height: 8),
                Container(width: double.infinity, height: 8, decoration: BoxDecoration(color: const Color(0xFFF3EAD3), borderRadius: BorderRadius.circular(4))),
                const SizedBox(height: 8),
                Container(width: 150, height: 8, decoration: BoxDecoration(color: const Color(0xFFF3EAD3), borderRadius: BorderRadius.circular(4))),
                const SizedBox(height: 24),
                // Placeholder Image
                Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEBE1D0),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Icon(Icons.search, size: 48, color: Colors.black26), // Mock magnifying glass
                  ),
                ),
                const SizedBox(height: 24),
                Container(width: double.infinity, height: 8, decoration: BoxDecoration(color: const Color(0xFFF3EAD3), borderRadius: BorderRadius.circular(4))),
                const SizedBox(height: 8),
                Container(width: 150, height: 8, decoration: BoxDecoration(color: const Color(0xFFF3EAD3), borderRadius: BorderRadius.circular(4))),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Zoom Controls
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFEBE1D0),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.zoom_out, size: 20, color: AppColors.textDark),
                  const SizedBox(width: 16),
                  const Text('100%', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(width: 16),
                  const Icon(Icons.zoom_in, size: 20, color: AppColors.textDark),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
