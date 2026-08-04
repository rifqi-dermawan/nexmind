import 'package:flutter/material.dart';

class AppRadius {
  AppRadius._();

  static const double smallValue = 4.0;
  static const double mediumValue = 8.0;
  static const double largeValue = 16.0;
  static const double extraLargeValue = 24.0;
  static const double pillValue = 999.0;

  static final BorderRadius small = BorderRadius.circular(smallValue);
  static final BorderRadius medium = BorderRadius.circular(mediumValue);
  static final BorderRadius large = BorderRadius.circular(largeValue);
  static final BorderRadius extraLarge = BorderRadius.circular(extraLargeValue);
  static final BorderRadius pill = BorderRadius.circular(pillValue);
}
