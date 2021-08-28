import 'package:flutter/material.dart';

import '../../../../../../app/theme/app_colors.dart';

/// [TileContainer] is the widget that works as a background for the [MovieTile].
class TileContainer extends StatelessWidget {
  /// The widget to be used inside this container. Usually, a [ListTile].
  final Widget child;

  /// Default constructor for this class.
  const TileContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: AppColors.strokeColor.withOpacity(0.3),
            offset: const Offset(1, 3),
            blurRadius: 8,
            spreadRadius: -3,
          ),
        ],
      ),
      child: child,
    );
  }
}
