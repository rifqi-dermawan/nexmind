import 'package:flutter/material.dart';
import '../../../core/theme.dart';

class DashboardBannerCard extends StatelessWidget {
  const DashboardBannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
        color: AppColors.bannerBackground,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.dashboard_customize_outlined, size: 40, color: Colors.orange.withOpacity(0.5)),
            const SizedBox(height: 8),
            Text(
              "UI Previews",
              style: TextStyle(color: Colors.orange.withOpacity(0.7), fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
