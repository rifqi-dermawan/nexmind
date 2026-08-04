import 'package:flutter/material.dart';

class AboutDescriptionCard extends StatelessWidget {
  const AboutDescriptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        'Nexmind is an AI-native administrative platform designed for high-performance file conversion and user management.',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          height: 1.5,
          color: Theme.of(context).textTheme.bodyLarge?.color,
        ),
      ),
    );
  }
}
