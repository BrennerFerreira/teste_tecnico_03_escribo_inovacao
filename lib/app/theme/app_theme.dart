import 'package:flutter/material.dart';

import 'app_colors.dart';

/// [AppTheme] defines the app theme.
class AppTheme {
  /// [theme]
  static final theme = ThemeData(
    primaryColor: AppColors.backgroundColor,
    accentColor: AppColors.accentColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.backgroundColor,
    ),
  );
}
