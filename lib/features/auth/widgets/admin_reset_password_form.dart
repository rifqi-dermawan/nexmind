import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/components/nexmind_text_field.dart';
import '../../../shared/components/nexmind_button.dart';

class AdminResetPasswordForm extends StatefulWidget {
  const AdminResetPasswordForm({super.key});

  @override
  State<AdminResetPasswordForm> createState() => _AdminResetPasswordFormState();
}

class _AdminResetPasswordFormState extends State<AdminResetPasswordForm> {
  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  bool _isLoading = false;

  void _handleReset() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      setState(() => _isLoading = false);
      // Pindah kembali ke halaman login setelah sukses reset
      context.go('/admin_login');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password reset successfully!')),
      );
    }
  }

  Widget _buildChecklistItem(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Icon(
            Icons.radio_button_unchecked,
            size: 20,
            color: Theme.of(context).iconTheme.color?.withValues(alpha: 0.4),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).textTheme.bodySmall?.color,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        NexmindTextField(
          label: 'New Password',
          hintText: 'Enter new password',
          prefixIcon: Icons.lock_outline,
          isPassword: true,
          obscureText: _obscurePassword,
          onToggleVisibility: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
        const SizedBox(height: 24),
        NexmindTextField(
          label: 'Confirm New Password',
          hintText: 'Re-enter new password',
          prefixIcon: Icons.lock_outline,
          isPassword: true,
          obscureText: _obscureConfirm,
          onToggleVisibility: () {
            setState(() {
              _obscureConfirm = !_obscureConfirm;
            });
          },
        ),
        const SizedBox(height: 32),
        
        // Password Requirements Card
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Password must contain:',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              _buildChecklistItem(context, 'Minimum 8 characters'),
              _buildChecklistItem(context, 'At least one uppercase letter'),
              _buildChecklistItem(context, 'At least one number'),
              _buildChecklistItem(context, 'At least one special character'),
            ],
          ),
        ),
        
        const SizedBox(height: 40),
        
        NexmindButton(
          text: 'Reset Password',
          onPressed: _handleReset,
          isLoading: _isLoading,
        ),
      ],
    );
  }
}
