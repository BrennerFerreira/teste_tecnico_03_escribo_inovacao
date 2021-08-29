import 'package:flutter/material.dart';

import '../../../../../../../app/theme/app_colors.dart';

/// [AvatarContainer] is the widget that will be used as a background for the
/// user avatar.
class AvatarContainer extends StatelessWidget {
  /// [child] is the widget that will be rendered inside this container.
  final Widget? child;

  /// [backgroundColor] is the color to be used in this container.
  final Color backgroundColor;

  /// Default constructor for this class.
  const AvatarContainer({
    Key? key,
    required this.backgroundColor,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 64,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
        border: Border.all(color: backgroundColor),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: child ??
            const Icon(
              Icons.person_outline,
              size: 40,
              color: AppColors.textColor,
            ),
      ),
    );
  }
}
