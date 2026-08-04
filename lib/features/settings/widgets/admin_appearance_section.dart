import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'admin_settings_menu_item.dart';

class AdminAppearanceSection extends StatefulWidget {
  const AdminAppearanceSection({super.key});

  @override
  State<AdminAppearanceSection> createState() => _AdminAppearanceSectionState();
}

class _AdminAppearanceSectionState extends State<AdminAppearanceSection> {
  String _selectedTheme = 'System'; // Light, Dark, System

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 12),
            child: Text(
              'Appearance',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              children: [
                Expanded(child: _buildThemeOption('Light', Icons.light_mode_outlined)),
                const SizedBox(width: 12),
                Expanded(child: _buildThemeOption('Dark', Icons.dark_mode_outlined)),
                const SizedBox(width: 12),
                Expanded(child: _buildThemeOption('System', Icons.settings_system_daydream_outlined)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          AdminSettingsMenuItem(
            icon: Icons.palette_outlined,
            title: 'Appearance Settings',
            showBorder: false,
            onTap: () {
              context.push('/admin_appearance');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildThemeOption(String title, IconData icon) {
    final isSelected = _selectedTheme == title;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    // In design, selected has a yellowish background and yellowish border in light mode.
    // We'll adapt for dark mode as well.
    final selectedBgColor = isDarkMode ? const Color(0xFF332D15) : const Color(0xFFFFF7DB);
    final selectedBorderColor = isDarkMode ? const Color(0xFFF1B000) : const Color(0xFFFFD54F);
    final selectedIconColor = isDarkMode ? const Color(0xFFF1B000) : const Color(0xFFB78103);
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTheme = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? selectedBgColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? selectedBorderColor : Theme.of(context).dividerColor.withValues(alpha: 0.5),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? selectedIconColor : Theme.of(context).iconTheme.color?.withValues(alpha: 0.6),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected ? selectedIconColor : Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
