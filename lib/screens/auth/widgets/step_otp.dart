import 'package:flutter/material.dart';
import '../../../widgets/primary_button.dart';

class StepOtp extends StatelessWidget {
  final TextEditingController otpController;
  final String email;
  final VoidCallback onNext;

  const StepOtp({
    super.key,
    required this.otpController,
    required this.email,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Verify Email',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Please enter the 4-digit verification code sent to \n${email.isNotEmpty ? email : "your email"}.',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
          TextField(
            controller: otpController,
            keyboardType: TextInputType.number,
            maxLength: 4,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, letterSpacing: 16, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              labelText: 'Verification Code',
              hintText: '0000',
              counterText: "",
              prefixIcon: const Icon(Icons.message_outlined, color: Colors.black54),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Color(0xFFF1B000), width: 1.5),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Center(
            child: TextButton(
              onPressed: () {
                // Resend OTP logic
              },
              child: const Text(
                'Resend Code',
                style: TextStyle(
                  color: Color(0xFF6B4E00),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            text: 'Verify',
            onPressed: onNext,
          ),
        ],
      ),
    );
  }
}
