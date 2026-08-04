import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/components/nexmind_text_field.dart';
import '../../../shared/components/nexmind_button.dart';

class AdminRegisterForm extends StatefulWidget {
  const AdminRegisterForm({super.key});

  @override
  State<AdminRegisterForm> createState() => _AdminRegisterFormState();
}

class _AdminRegisterFormState extends State<AdminRegisterForm> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  void _handleRegister() async {
    setState(() => _isLoading = true);
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      setState(() => _isLoading = false);
      // Navigate to admin dashboard
      context.go('/admin'); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const NexmindTextField(
          label: 'Full Name',
          hintText: 'Enter your full name',
        ),
        const SizedBox(height: 16),
        const NexmindTextField(
          label: 'Email',
          hintText: 'Enter your email',
        ),
        const SizedBox(height: 16),
        NexmindTextField(
          label: 'Password',
          hintText: 'Enter your password',
          isPassword: true,
          obscureText: _obscurePassword,
          onToggleVisibility: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
        const SizedBox(height: 16),
        NexmindTextField(
          label: 'Confirm Password',
          hintText: 'Confirm your password',
          isPassword: true,
          obscureText: _obscureConfirmPassword,
          onToggleVisibility: () {
            setState(() {
              _obscureConfirmPassword = !_obscureConfirmPassword;
            });
          },
        ),
        const SizedBox(height: 32),
        NexmindButton(
          text: 'Create Account',
          onPressed: _handleRegister,
          isLoading: _isLoading,
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an account? ",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).textTheme.bodySmall?.color,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            GestureDetector(
              onTap: () {
                context.go('/admin_login');
              },
              child: Text(
                'Login',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
