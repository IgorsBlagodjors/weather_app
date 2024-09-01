import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather_app/design_system/app_colors.dart';
import 'package:weather_app/design_system/app_styles.dart';
import 'package:weather_app/presentation/widgets/forecast_details_page_widgets/forecast_details_container.dart';

class Pressure extends StatelessWidget {
  final double preasure;
  const Pressure({super.key, required this.preasure});

  @override
  Widget build(BuildContext context) {
    return WeatherDetailsContainer(
      width: 164,
      height: 164,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.speed,
                    size: 15, color: AppColors.weatherDetailsSubheadline),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  'PRESSURE',
                  style: AppStyles.boldFootnote.copyWith(
                    color: AppColors.weatherDetailsSubheadline,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: CustomPaint(
                painter: PressurePainter(degrees: preasure),
                size: const Size(113, 103),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PressurePainter extends CustomPainter {
  final double degrees;
  PressurePainter({required this.degrees});
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = min(centerX, centerY);

    Paint circlePaint = Paint()
      ..color = AppColors.circleColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    double lineLength = 10;
    for (int i = 0; i < 360; i += 8) {
      double angle = pi * i / 180;
      double startX = centerX + (radius - lineLength) * cos(angle);
      double startY = centerY + (radius - lineLength) * sin(angle);
      double endX = centerX + radius * cos(angle);
      double endY = centerY + radius * sin(angle);

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), circlePaint);
    }

    //  arrow
    double angle = pi * degrees / 180;
    double arrowSize = 12;
    Path arrowPath = Path();
    Paint arrowPaint = Paint()
      ..color = AppColors.darkPrimary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    arrowPath.moveTo(
        centerX + (radius) * cos(angle), centerY + (radius) * sin(angle));
    arrowPath.lineTo(centerX + (radius - arrowSize) * cos(angle),
        centerY + (radius - arrowSize) * sin(angle));
    canvas.drawPath(arrowPath, arrowPaint);

    // blur effect to the left of the arrow
    Paint blurPaint = Paint()
      ..color = AppColors.darkPrimary.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 11
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);
    for (int i = (degrees - 30).toInt(); i < degrees; i += 8) {
      double blurAngle = pi * i / 180;
      double blurStartX = centerX + (radius) * cos(blurAngle);
      double blurStartY = centerY + (radius) * sin(blurAngle);
      double blurEndX = centerX + (radius - 10) * cos(blurAngle);
      double blurEndY = centerY + (radius - 10) * sin(blurAngle);
      canvas.drawLine(Offset(blurStartX, blurStartY),
          Offset(blurEndX, blurEndY), blurPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
