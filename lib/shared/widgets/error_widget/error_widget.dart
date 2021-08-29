import 'package:flutter/material.dart';

import '../../../app/theme/app_text_styles.dart';
import '../../constants/constants.dart';

/// [ErrorTextWidget] is used every time there is an error while fetching data
/// from the API.
class ErrorTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        AppConstants.errorText,
        style: AppTextStyles.textRegular,
        textAlign: TextAlign.center,
      ),
    );
  }
}
