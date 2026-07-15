import 'package:flutter/material.dart';

class SocialLoginButtons extends StatelessWidget {
  final bool isVertical;

  const SocialLoginButtons({super.key, this.isVertical = false});

  @override
  Widget build(BuildContext context) {
    if (isVertical) {
      return Column(
        children: [
          _buildGoogleButton(),
          const SizedBox(height: 8),
          _buildAppleButton(),
        ],
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: _buildGoogleButton()),
        const SizedBox(width: 16),
        Expanded(child: _buildAppleButton()),
      ],
    );
  }

  Widget _buildGoogleButton() {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: const Text(
          'G',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        label: const Text(
          'Google',
          style: TextStyle(color: Colors.black87),
        ),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          side: BorderSide(color: Colors.grey.shade300),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
      ),
    );
  }

  Widget _buildAppleButton() {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.apple, color: Colors.black87),
        label: const Text(
          'Apple',
          style: TextStyle(color: Colors.black87),
        ),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          side: BorderSide(color: Colors.grey.shade300),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
      ),
    );
  }
}
