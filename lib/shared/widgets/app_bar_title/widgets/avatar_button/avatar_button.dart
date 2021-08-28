import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';

/// [AvatarButton] is the widget that is placed in the app AppBar that
/// redirects to the avatar choice page.
class AvatarButton extends StatelessWidget {
  /// The color used in the background of this widget.
  final Color backgroundColor;

  /// The function called when this button is pressed.
  final VoidCallback onPressed;

  /// Default constructor for this class.
  const AvatarButton({
    Key? key,
    required this.backgroundColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 64,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
        border: Border.all(color: AppColors.strokeColor),
      ),
      child: InkWell(
        onTap: onPressed,
        child: const Icon(
          Icons.person,
          color: AppColors.textColor,
          size: 40,
        ),
      ),
    );
  }
}
