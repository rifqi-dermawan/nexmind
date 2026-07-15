import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../core/theme.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    // Icons based on selected state to match the outline/filled style in the image
    final List<IconData> unselectedIcons = [
      CupertinoIcons.house,
      CupertinoIcons.checkmark_circle, // Diganti ke ikon tasks/checkmark
      CupertinoIcons.arrow_2_squarepath,
      CupertinoIcons.person,
    ];

    final List<IconData> selectedIcons = [
      CupertinoIcons.house_fill,
      CupertinoIcons.checkmark_circle_fill, // Diganti ke ikon tasks/checkmark filled
      CupertinoIcons.arrow_2_squarepath,
      CupertinoIcons.person_fill,
    ];

    final List<String> labels = [
      "Home",
      "Tasks",
      "Converter",
      "Profile",
    ];

    // Get screen width safely
    final screenWidth = MediaQuery.of(context).size.width;
    final navBarWidth = screenWidth > 400 ? 340.0 : screenWidth - 48.0; // Sedikit dikecilkan

    return SafeArea(
      bottom: false,
      child: Container(
        height: 90, // Lebih kecil dari sebelumnya
        alignment: Alignment.bottomCenter,
        child: Container(
          width: navBarWidth,
          height: 64, // Diperkecil ukurannya
          margin: const EdgeInsets.only(bottom: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              // box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.37); /* Drop Shadow */
              BoxShadow(
                color: Colors.black.withOpacity(0.37),
                blurRadius: 32,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: BackdropFilter(
              // backdrop-filter: blur(20px); /* Backdrop Blur */
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                decoration: BoxDecoration(
                  // background: rgba(255, 255, 255, 0.1); /* Translucency */
                  color: Colors.white.withOpacity(0.1), 
                  borderRadius: BorderRadius.circular(32),
                  // border: 1px solid rgba(255, 255, 255, 0.2); /* Specular Highlight/Mirror */
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
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
                            // Wide capsule shape matching the image
                            width: (navBarWidth / unselectedIcons.length) - 12,
                            height: 48, // Lebih kecil menyesuaikan tinggi navbar
                            decoration: BoxDecoration(
                              // Warna aktif khusus sesuai permintaan
                              color: const Color(0xFFF5B400),
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFFF5B400).withOpacity(0.4),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // The Icons and Text
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
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AnimatedSwitcher(
                                      duration: const Duration(milliseconds: 200),
                                      transitionBuilder: (Widget child, Animation<double> animation) {
                                        return FadeTransition(opacity: animation, child: child);
                                      },
                                      child: Icon(
                                        icon,
                                        key: ValueKey<IconData>(icon), // Forces AnimatedSwitcher to animate
                                        color: isSelected 
                                            ? AppColors.textBrown // Warna coklat gelap agar kontras dengan kuning
                                            : Colors.white.withOpacity(0.7), // Dikembalikan ke warna putih transparan
                                        size: 22, // Diperkecil agar proporsional dengan teks
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      labels[idx],
                                      style: TextStyle(
                                        fontSize: 10, // Ukuran teks kecil dan rapi
                                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                                        color: isSelected 
                                            ? AppColors.textBrown 
                                            : Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                  ],
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
