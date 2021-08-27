import 'package:flutter/material.dart';
import 'package:teste_tecnico_03_escribo_inovacao/app/theme/app_text_styles.dart';

import '../../../../shared/constants/constants.dart';
import 'widgets/parallelogram_shape.dart';

/// [WebsiteButton] is the widget that is placed in the app AppBar that
/// redirects to a web view of the Star Wars community website.
class WebsiteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      child: SizedBox(
        height: 64,
        width: 136,
        child: ClipRRect(
          child: CustomPaint(
            painter: ParallelogramShape(),
            child: const Center(
              child: Text(
                AppConstants.website,
                style: AppTextStyles.textRegular,
                softWrap: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
