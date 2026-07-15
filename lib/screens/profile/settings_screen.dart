import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../../widgets/custom_bottom_nav.dart';
import '../main/main_screen.dart';
import '../auth/login_screen.dart';
import 'widgets/setting_item.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 12, top: 24),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppColors.textBrown,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildCardContainer({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final lightBeige = const Color(0xFFF3EAD3);
    
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFFFDF7E8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDF7E8),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Card
            _buildCardContainer(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.grey[200],
                      backgroundImage: const AssetImage('assets/images/avatar.png'),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Hendri Saputra',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'hendri.s@example.com',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.textLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right, color: AppColors.textDark),
                  ],
                ),
              ),
            ),
            
            // PREFERENCES
            _buildSectionTitle('PREFERENCES'),
            _buildCardContainer(
              child: Column(
                children: [
                  SettingItem(
                    icon: Icons.dark_mode_outlined,
                    iconBackgroundColor: const Color(0xFFFFCA28), // Yellow
                    title: 'Dark Mode',
                    trailing: Switch(
                      value: false,
                      onChanged: (val) {},
                      activeColor: AppColors.primary,
                    ),
                  ),
                  SettingItem(
                    icon: Icons.language,
                    iconBackgroundColor: lightBeige,
                    title: 'Language',
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('English', style: TextStyle(color: AppColors.textDark, fontSize: 14)),
                        SizedBox(width: 8),
                        Icon(Icons.chevron_right, color: AppColors.textDark),
                      ],
                    ),
                  ),
                  SettingItem(
                    icon: Icons.notifications_none,
                    iconBackgroundColor: lightBeige,
                    title: 'Notifications',
                    showDivider: false,
                  ),
                ],
              ),
            ),
            
            // DATA
            _buildSectionTitle('DATA'),
            _buildCardContainer(
              child: SettingItem(
                icon: Icons.storage_outlined,
                iconBackgroundColor: lightBeige,
                title: 'Storage',
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('2.4 GB', style: TextStyle(color: AppColors.textDark, fontSize: 14)),
                    SizedBox(width: 8),
                    Icon(Icons.chevron_right, color: AppColors.textDark),
                  ],
                ),
                showDivider: false,
              ),
            ),
            
            // SUPPORT
            _buildSectionTitle('SUPPORT'),
            _buildCardContainer(
              child: Column(
                children: [
                  SettingItem(
                    icon: Icons.help_outline,
                    iconBackgroundColor: lightBeige,
                    title: 'Help Center',
                  ),
                  SettingItem(
                    icon: Icons.privacy_tip_outlined,
                    iconBackgroundColor: lightBeige,
                    title: 'Privacy Policy',
                  ),
                  SettingItem(
                    icon: Icons.info_outline,
                    iconBackgroundColor: lightBeige,
                    title: 'About StudyMate',
                    showDivider: false,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Sign Out
            SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.logout, color: Color(0xFFC62828)),
                label: const Text(
                  'Sign Out',
                  style: TextStyle(
                    color: Color(0xFFC62828),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFFFCDD2).withOpacity(0.5), // Very light red
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Version
            const Center(
              child: Text(
                'Version 1.0.1',
                style: TextStyle(
                  color: AppColors.textLight,
                  fontSize: 12,
                ),
              ),
            ),
            
            const SizedBox(height: 120), // Bottom navigation padding
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: 3, // Profile tab
        onItemTapped: (index) {
          if (index != 3) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => MainScreen(initialIndex: index),
              ),
              (route) => false,
            );
          } else {
            Navigator.pop(context); // Go back to Profile screen
          }
        },
      ),
    );
  }
}
