import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/theme_provider.dart';
import '../../widgets/admin_bottom_nav_bar.dart';

class AdminAppearanceScreen extends StatefulWidget {
  const AdminAppearanceScreen({super.key});

  @override
  State<AdminAppearanceScreen> createState() => _AdminAppearanceScreenState();
}

class _AdminAppearanceScreenState extends State<AdminAppearanceScreen> {
  late String _selectedTheme;

  @override
  void initState() {
    super.initState();
    final currentMode = ThemeProvider.themeModeNotifier.value;
    if (currentMode == ThemeMode.light) {
      _selectedTheme = 'Light Mode';
    } else if (currentMode == ThemeMode.dark) {
      _selectedTheme = 'Dark Mode';
    } else {
      _selectedTheme = 'System';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).iconTheme.color),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/admin_settings');
            }
          },
        ),
        title: Text(
          'Appearance',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              if (isDarkMode) {
                ThemeProvider.changeTheme(ThemeMode.light);
              } else {
                ThemeProvider.changeTheme(ThemeMode.dark);
              }
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme Selection',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Choose how Nexmind looks to you.',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 24),
            _buildThemeOption(
              context,
              title: 'Light Mode',
              subtitle: 'Clean and bright interface',
              icon: Icons.light_mode_outlined,
            ),
            const SizedBox(height: 16),
            _buildThemeOption(
              context,
              title: 'Dark Mode',
              subtitle: 'Easier on the eyes in low light',
              icon: Icons.dark_mode_outlined,
            ),
            const SizedBox(height: 16),
            _buildThemeOption(
              context,
              title: 'System',
              subtitle: 'Follows your device settings',
              icon: Icons.settings_system_daydream_outlined,
            ),
          ],
        ),
      ),
      bottomNavigationBar: AdminBottomNavBar(
        selectedIndex: 3, // Settings is active
        onItemTapped: (index) {
          if (index == 0) {
            context.go('/admin');
          } else if (index == 1) {
            context.push('/admin_users');
          } else if (index == 2) {
            context.push('/admin_conversions');
          } else if (index == 3) {
            context.go('/admin_settings');
          }
        },
      ),
    );
  }

  Widget _buildThemeOption(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    final isSelected = _selectedTheme == title;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    // Background circle for the icon
    final iconBgColor = isSelected 
        ? const Color(0xFFFFF7DB) // Light yellow
        : Theme.of(context).dividerColor.withValues(alpha: 0.3);
    
    final iconColor = isSelected ? const Color(0xFFB78103) : Theme.of(context).iconTheme.color;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTheme = title;
        });
        if (title == 'Light Mode') {
          ThemeProvider.changeTheme(ThemeMode.light);
        } else if (title == 'Dark Mode') {
          ThemeProvider.changeTheme(ThemeMode.dark);
        } else {
          ThemeProvider.changeTheme(ThemeMode.system);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected && !isDark 
                ? const Color(0xFFFFD54F) 
                : (isSelected && isDark ? const Color(0xFFF1B000) : Colors.transparent),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDark && isSelected ? const Color(0xFF332D15) : iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected 
                      ? const Color(0xFFF1B000) 
                      : Theme.of(context).dividerColor,
                  width: isSelected ? 6 : 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
