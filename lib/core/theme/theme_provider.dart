import 'package:flutter/material.dart';

class ThemeProvider {
  static final ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier(ThemeMode.system);

  static void changeTheme(ThemeMode themeMode) {
    themeModeNotifier.value = themeMode;
  }
}
