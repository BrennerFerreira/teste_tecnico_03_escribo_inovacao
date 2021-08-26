import 'package:flutter/rendering.dart';

import 'app_colors.dart';

/// [AppTextStyles] holds all the styles for the texts used in the app.
class AppTextStyles {
  /// [textRegular] is the TextStyle used for all main texts in the app.
  static const textRegular = TextStyle(
    fontSize: 18,
    color: AppColors.textColor,
  );

  /// [appBarTextRegular] is the TextStyle used for texts in the app AppBar.
  static const appBarTextRegular = TextStyle(
    fontSize: 16,
    color: AppColors.textColor,
  );
}
