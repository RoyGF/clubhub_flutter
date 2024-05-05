// app_theme.dart
import 'package:flutter/material.dart';
import 'colors.dart'; // Import your custom colors file

class AppTheme {
  static ThemeData get lightTheme {
    // Define light theme settings
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColors.secondaryColor,
        primary: AppColors.primaryColor,
        surface: AppColors.backgroundColor,
        onSurface: AppColors.textColor,
        error: AppColors.errorColor,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
      ),
      scaffoldBackgroundColor: AppColors.backgroundColor,
      textTheme: const TextTheme(
        displayMedium: TextStyle(color: AppColors.textColor),
        bodyMedium: TextStyle(color: AppColors.textColor),
      ),
      appBarTheme: const AppBarTheme(
        color: AppColors.primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
    );
  }
}
