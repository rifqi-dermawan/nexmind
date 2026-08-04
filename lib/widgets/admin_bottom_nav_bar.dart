import 'dart:ui';
import 'package:flutter/material.dart';

class AdminBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const AdminBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    // Icons based on selected state to match the admin design
    final List<IconData> unselectedIcons = [
      Icons.grid_view,
      Icons.people_outline,
      Icons.analytics_outlined,
      Icons.settings_outlined,
    ];

    final List<IconData> selectedIcons = [
      Icons.grid_view_rounded,
      Icons.people_alt,
      Icons.analytics,
      Icons.settings,
    ];

    // Get screen width safely
    final screenWidth = MediaQuery.of(context).size.width;
    final navBarWidth = screenWidth > 400 ? 340.0 : screenWidth - 48.0;

    return SafeArea(
      bottom: false,
      child: Container(
        height: 90,
        alignment: Alignment.bottomCenter,
        child: Container(
          width: navBarWidth,
          height: 64,
          margin: const EdgeInsets.only(bottom: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 32,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(
                    color: Colors.grey.withValues(alpha: 0.1),
                    width: 1.0,
                  ),
                ),
                child: Stack(
                  children: [
                    // The Capsule Bubble Indicator
                    AnimatedAlign(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOutCubic,
                      alignment: Alignment(
                        -1.0 + (selectedIndex * 2.0 / (unselectedIcons.length - 1)),
                        0.0,
                      ),
                      child: FractionallySizedBox(
                        widthFactor: 1.0 / unselectedIcons.length,
                        child: Center(
                          child: Container(
                            width: (navBarWidth / unselectedIcons.length) - 12,
                            height: 48,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFCA28), // Nexmind Yellow
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // The Icons
                    Row(
                      children: List.generate(unselectedIcons.length, (idx) {
                        bool isSelected = selectedIndex == idx;
                        IconData icon = isSelected ? selectedIcons[idx] : unselectedIcons[idx];

                        return Expanded(
                          child: GestureDetector(
                            onTap: () => onItemTapped(idx),
                            behavior: HitTestBehavior.opaque,
                            child: SizedBox(
                              height: 64,
                              child: Center(
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 200),
                                  transitionBuilder: (Widget child, Animation<double> animation) {
                                    return ScaleTransition(scale: animation, child: child);
                                  },
                                  child: Icon(
                                    icon,
                                    key: ValueKey<IconData>(icon),
                                    color: isSelected 
                                        ? Colors.black
                                        : Theme.of(context).iconTheme.color?.withValues(alpha: 0.6),
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
