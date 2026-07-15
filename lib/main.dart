// lib/main.dart
import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(const StudyMateApp());
}

class StudyMateApp extends StatelessWidget {
  const StudyMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nexmind',
      builder: (context, child) {
        final screenWidth = MediaQuery.of(context).size.width;
        final isLargeScreen = screenWidth > 480;

        return Container(
          color: const Color(0xFFF0F0F0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: isLargeScreen ? 24.0 : 0.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(isLargeScreen ? 24.0 : 0.0),
                  boxShadow: isLargeScreen
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            spreadRadius: 5,
                            offset: const Offset(0, 10),
                          ),
                        ]
                      : null,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(isLargeScreen ? 24.0 : 0.0),
                  child: child!,
                ),
              ),
            ),
          ),
        );
      },
      home: const SplashScreen(),
    );
  }
}