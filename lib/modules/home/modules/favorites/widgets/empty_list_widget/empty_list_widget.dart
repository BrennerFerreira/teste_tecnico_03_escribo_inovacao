import 'package:flutter/material.dart';

import '../../../../../../app/theme/app_text_styles.dart';
import '../../../../../../shared/constants/constants.dart';

/// Widget used as body when favorites list is empty.
class EmptyListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        AppConstants.emptyFavoritesText,
        style: AppTextStyles.textRegular,
        textAlign: TextAlign.center,
      ),
    );
  }
}
