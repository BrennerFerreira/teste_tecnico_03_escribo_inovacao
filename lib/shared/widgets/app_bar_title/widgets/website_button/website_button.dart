import 'package:flutter/material.dart';

import '../../../../../app/theme/app_text_styles.dart';
import '../../../../constants/constants.dart';
import 'widgets/parallelogram_shape/parallelogram_shape.dart';

/// [WebsiteButton] is the widget that is placed in the app AppBar that
/// redirects to a web view of the Star Wars community website.
class WebsiteButton extends StatelessWidget {
  /// The function that will be called when this button is pressed by the user.
  final VoidCallback onPressed;

  /// The color used in the background of this button.
  final Color backgroundColor;

  /// Default constructor for this class.
  const WebsiteButton({
    Key? key,
    required this.onPressed,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: SizedBox(
        height: 64,
        width: 136,
        child: CustomPaint(
          painter: ParallelogramShape(backgroundColor),
          child: const Center(
            child: Text(
              AppConstants.website,
              style: AppTextStyles.textRegular,
              softWrap: false,
            ),
          ),
        ),
      ),
    );
  }
}
