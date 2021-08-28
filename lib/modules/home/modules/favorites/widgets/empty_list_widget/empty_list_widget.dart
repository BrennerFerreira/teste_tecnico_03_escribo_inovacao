import 'package:flutter/material.dart';

import '../../../../../../app/theme/app_text_styles.dart';

/// Widget used as body when favorites list is empty.
class EmptyListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Nenhum item foi marcado como favorito!",
        style: AppTextStyles.textRegular,
        textAlign: TextAlign.center,
      ),
    );
  }
}
