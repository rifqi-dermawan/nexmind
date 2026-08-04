import 'package:flutter/material.dart';

class AboutHeader extends StatelessWidget {
  const AboutHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        // Using a Row with Text and Icon as a fallback if logo image doesn't exist,
        // but trying to load an asset first is common. We'll build a custom logo widget
        // that matches the "nexmind" look just in case, using text and an icon.
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ne',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).textTheme.bodyLarge?.color,
                letterSpacing: -1.5,
              ),
            ),
            Icon(
              Icons.all_inclusive, 
              size: 40,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
            Text(
              'mind',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).textTheme.bodyLarge?.color,
                letterSpacing: -1.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'Nexmind',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Version 1.2.0',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Build 2026.07.23',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
