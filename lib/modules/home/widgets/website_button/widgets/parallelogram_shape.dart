import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';

/// [ParallelogramShape] draws the parallelogram box to hold website button
/// in the app [AppBar].
class ParallelogramShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = (AppColors.strokeColor)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final Path path = Path()
      ..moveTo(size.width * 0.2, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width * 0.8, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
