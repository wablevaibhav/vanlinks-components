import 'package:flutter/material.dart';

class VanlinksColors {
  const VanlinksColors._();

  // Brand Colors
  static const Color primaryColor = Color(0xFFFFDF00); // Yellow
  static const Color secondaryColor = Color(0xFF00BFFF); // Sky Blue
  static const Color accentColor = Color(0xFFFF5722); // Deep Orange

  // Base Colors
  static const Color blackColor = Colors.black;
  static const Color whiteColor = Colors.white;
  static const Color darkGray = Color(0xFF212121); // For text titles
  static const Color mediumGray = Color(0xFF757575); // For subtitles, labels
  static const Color lightGray = Color(0xFFF5F5F5); // For backgrounds, surfaces
  static const Color dividerColor = Color(0xFFE0E0E0); // For dividers

  // Feedback Colors
  static const Color redColor = Color(0xFFFE0000); // Error
  static const Color greenColor = Color(0xFF15BE0E); // Success
  static const Color blueColor = Color(0xFF2196F3); // Info

  // Utility Colors
  static const Color disabledColor =
      Color(0xFF9E9E9E); // Disabled button/form elements
  static const Color shadowColor =
      Color(0x29000000); // Shadow effect with 16% opacity
  static const Color overlayColor =
      Color(0x99000000); // Black overlay with 60% opacity

  // Button Colors
  static const Color buttonColor = primaryColor; // Primary button color
  static const Color buttonHoverColor =
      Color(0xFFE6C300); // Lighter shade for hover effects

  // Additional Utility Colors
  static const Color warningColor =
      Color(0xFFFFC107); // Amber (used for warnings)
  static const Color highlightColor =
      Color(0xFF00E676); // Bright green for attention
  static const Color tooltipBackgroundColor =
      Color(0xFF616161); // Dark gray for tooltips
}
