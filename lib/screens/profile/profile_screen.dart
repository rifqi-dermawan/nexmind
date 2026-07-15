import 'package:flutter/material.dart';
import '../../core/theme.dart';
import 'widgets/profile_stats_card.dart';
import 'widgets/profile_menu_item.dart';
import 'settings_screen.dart';
import '../auth/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDF7E8), // Beige app bar
        elevation: 0,
        scrolledUnderElevation: 0.0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: IconButton(
              icon: const Icon(Icons.settings_outlined, color: AppColors.textDark),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsScreen()),
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 120), // Bottom padding for nav bar
        child: Column(
          children: [
            // Avatar
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/avatar.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[200],
                    child: const Icon(Icons.person, size: 50, color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            
            // Name & Email
            const Text(
              'Hendri Saputra',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'hendri.saputra@example.com',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textLight,
              ),
            ),
            const SizedBox(height: 20),
            
            // Stats
            Row(
              children: const [
                Expanded(
                  child: ProfileStatsCard(
                    value: '124',
                    label: 'TASKS DONE',
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ProfileStatsCard(
                    value: '48h',
                    label: 'STUDY TIME',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Main Menu
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
                ],
              ),
              child: Column(
                children: [
                  ProfileMenuItem(icon: Icons.person_outline, title: 'My Account', onTap: () {}),
                  ProfileMenuItem(
                    icon: Icons.dark_mode_outlined,
                    title: 'Dark Mode',
                    trailing: Switch(
                      value: isDarkMode,
                      onChanged: (val) {
                        setState(() {
                          isDarkMode = val;
                        });
                      },
                      activeColor: AppColors.primary,
                    ),
                  ),
                  ProfileMenuItem(icon: Icons.notifications_none, title: 'Notifications', onTap: () {}),
                  ProfileMenuItem(
                    icon: Icons.language,
                    title: 'Language',
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('English', style: TextStyle(color: AppColors.textDark, fontSize: 14)),
                        SizedBox(width: 8),
                        Icon(Icons.chevron_right, color: AppColors.textDark),
                      ],
                    ),
                    showDivider: false,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            
            // Help Menu
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
                ],
              ),
              child: Column(
                children: [
                  ProfileMenuItem(icon: Icons.help_outline, title: 'Help & Support', onTap: () {}),
                  ProfileMenuItem(icon: Icons.info_outline, title: 'About StudyMate', showDivider: false, onTap: () {}),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Log Out Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                    (route) => false,
                  );
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.red,
                  side: BorderSide(color: Colors.red.withOpacity(0.3)),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                child: const Text(
                  'Log Out',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
