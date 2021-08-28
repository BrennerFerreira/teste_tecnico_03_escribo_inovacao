import 'package:flutter/material.dart';
import 'package:teste_tecnico_03_escribo_inovacao/app/theme/app_colors.dart';

/// [ParallelogramShape] draws the parallelogram box to hold website button
/// in the app [AppBar].
class ParallelogramShape extends CustomPainter {
  /// The color of the inner background of this shape.
  final Color backgroundColor;

  /// Default constructor for this class.
  ParallelogramShape(this.backgroundColor);
  @override
  void paint(Canvas canvas, Size size) {
    final Paint borderPaint = Paint()
      ..color = AppColors.strokeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final Paint innerPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    final Path path = Path()
      ..moveTo(size.width * 0.2, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width * 0.8, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, borderPaint);
    canvas.drawPath(path, innerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
