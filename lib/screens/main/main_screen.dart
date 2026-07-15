import 'package:flutter/material.dart';
import '../../widgets/custom_bottom_nav.dart';
import '../dashboard/home_dashboard.dart';
import '../tasks/task_list.dart';
import '../converter/file_converter.dart';
import '../profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  final int initialIndex;

  const MainScreen({super.key, this.initialIndex = 0});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Define the screens here so hot reload works correctly
    final List<Widget> screens = [
      const HomeDashboard(),
      const TaskListScreen(),
      const FileConverterScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0), // Matches app background
      extendBody: true, // Content scrolls behind transparent nav bar
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
