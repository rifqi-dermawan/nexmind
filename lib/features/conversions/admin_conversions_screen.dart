import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/admin_bottom_nav_bar.dart';
import '../../core/theme/theme_provider.dart';
import 'widgets/conversions_stats_grid.dart';
import 'widgets/conversions_filter_chips.dart';
import 'widgets/conversion_item_card.dart';

class AdminConversionsScreen extends StatelessWidget {
  const AdminConversionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 80,
        leading: Row(
          children: [
            const SizedBox(width: 24),
            CircleAvatar(
              radius: 20,
              backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.2),
              child: const Icon(Icons.person, color: Colors.black54),
            ),
          ],
        ),
        title: Text(
          'Dashboard', // Based on the design provided
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: false,
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
          IconButton(
            icon: Icon(Icons.search, color: Theme.of(context).iconTheme.color),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.filter_list, color: Theme.of(context).iconTheme.color),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ConversionsStatsGrid(),
            const SizedBox(height: 8),
            const ConversionsFilterChips(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: Column(
                children: const [
                  ConversionItemCard(
                    filename: 'report_2024.pdf',
                    uploader: 'Alex Rivera',
                    date: 'Oct 12, 2023',
                    status: 'Successful',
                    duration: '1.2s',
                  ),
                  ConversionItemCard(
                    filename: 'financial_q3.xlsx',
                    uploader: 'Sarah Jenkins',
                    date: 'Oct 11, 2023',
                    status: 'Successful',
                    duration: '3.4s',
                  ),
                  ConversionItemCard(
                    filename: 'presentation_v2.pptx',
                    uploader: 'Michael Chen',
                    date: 'Oct 10, 2023',
                    status: 'Pending',
                    duration: '-',
                  ),
                  ConversionItemCard(
                    filename: 'contract_draft.docx',
                    uploader: 'Elena Rodriguez',
                    date: 'Oct 09, 2023',
                    status: 'Failed',
                    duration: '0.8s',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: AdminBottomNavBar(
        selectedIndex: 2, // Index 2 is Analytics/Conversions
        onItemTapped: (index) {
          if (index == 0) {
            context.go('/admin');
          } else if (index == 1) {
            context.push('/admin_users');
          } else if (index == 3) {
            context.push('/admin_settings');
          }
        },
      ),
    );
  }
}
