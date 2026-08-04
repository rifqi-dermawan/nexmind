import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/theme_provider.dart';
import 'widgets/admin_login_form.dart';

class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Top Action (Theme Toggle)
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: IconButton(
                            icon: Icon(isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
                            onPressed: () {
                              if (isDarkMode) {
                                ThemeProvider.changeTheme(ThemeMode.light);
                              } else {
                                ThemeProvider.changeTheme(ThemeMode.dark);
                              }
                            },
                          ),
                        ),
                      ),
                      
                      // Center Content
                      Column(
                        children: [
                          // Logo Image with graceful fallback to text
                          Image.asset(
                            'assets/images/logo.png',
                            height: 48,
                            errorBuilder: (context, error, stackTrace) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('ne', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700, color: textColor, letterSpacing: -1.5)),
                                  Icon(Icons.all_inclusive, size: 44, color: textColor),
                                  Text('mind', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700, color: textColor, letterSpacing: -1.5)),
                                ],
                              );
                            },
                          ),
                          const SizedBox(height: 48),
                          Text(
                            'Welcome Back',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Sign in to your Nexmind Admin account.',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Theme.of(context).textTheme.bodySmall?.color,
                                ),
                          ),
                          const SizedBox(height: 48),
                          
                          // Form Component
                          const AdminLoginForm(),
                        ],
                      ),
                      
                      // Footer
                      Padding(
                        padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an admin account? ",
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context).textTheme.bodySmall?.color,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            GestureDetector(
                              onTap: () {
                                context.go('/admin_register');
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
