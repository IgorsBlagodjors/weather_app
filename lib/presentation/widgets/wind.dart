import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/design_system/app_colors.dart';
import 'package:weather_app/design_system/app_styles.dart';
import 'package:weather_app/presentation/widgets/weather_details_container.dart';

class Wind extends StatelessWidget {
  const Wind({super.key});

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
                const FaIcon(FontAwesomeIcons.wind,
                    size: 15, color: AppColors.weatherDetailsSubheadline),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  'WIND',
                  style: AppStyles.boldFootnote.copyWith(
                    color: AppColors.weatherDetailsSubheadline,
                  ),
                ),
              ],
            ),
            Center(
              child: CustomPaint(
                painter: WindDirectionPainter(degrees: 180),
                size: const Size(113, 113),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WindDirectionPainter extends CustomPainter {
  final double degrees;

  WindDirectionPainter({required this.degrees});
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = min(centerX, centerY) - 10;

    Paint circlePaint = Paint()
      ..color = AppColors.weatherDetailsSubheadline
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.1;

    double lineLength = 7;
    for (int i = 0; i < 360; i += 2) {
      double angle = pi * i / 180;
      double startX = centerX + (radius - lineLength) * cos(angle);
      double startY = centerY + (radius - lineLength) * sin(angle);
      double endX = centerX + radius * cos(angle);
      double endY = centerY + radius * sin(angle);
      if (i % 90 == 0) {
        circlePaint.strokeWidth = 2.0;
      } else if (i % 30 == 0) {
        circlePaint.strokeWidth = 0.5;
      } else {
        circlePaint.strokeWidth = 0.1;
      }

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), circlePaint);
    }

    // "Wind direction arrow
    double angle = pi * degrees / 180;
    double arrowSize = 25;
    double boxSize = arrowSize / 3.57;
    Paint boxPaint = Paint()
      ..color = AppColors.darkPrimary
      ..style = PaintingStyle.fill;
    Path boxPath = Path();
    Path arrowPath = Path();
    Paint arrowPaint = Paint()
      ..color = AppColors.darkPrimary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    boxPath.moveTo(
        centerX + radius * cos(angle), centerY + radius * sin(angle));
    boxPath.lineTo(centerX + (radius - boxSize) * cos(angle - pi / 30),
        centerY + (radius - boxSize) * sin(angle - pi / 30));
    boxPath.lineTo(centerX + (radius - 5) * cos(angle),
        centerY + (radius - 5) * sin(angle));
    boxPath.lineTo(centerX + (radius - boxSize) * cos(angle + pi / 30),
        centerY + (radius - boxSize) * sin(angle + pi / 30));

    arrowPath.moveTo(centerX + (radius - 5) * cos(angle),
        centerY + (radius - 5) * sin(angle));
    arrowPath.lineTo(centerX + (radius - arrowSize) * cos(angle),
        centerY + (radius - arrowSize) * sin(angle));

    canvas.drawPath(boxPath, boxPaint);
    canvas.drawPath(arrowPath, arrowPaint);

    //Middle text
    TextPainter speedIndicator = TextPainter(
      text: const TextSpan(
        text: '9.7 ',
        style: AppStyles.boldBody,
      ),
      textDirection: TextDirection.ltr,
    );
    speedIndicator.layout();
    double textWidth = speedIndicator.width;
    double textHeight = speedIndicator.height;
    double textX = centerX - textWidth / 2;
    double textY = centerY - textHeight / 2 - 10;
    speedIndicator.paint(canvas, Offset(textX, textY));

    //Middle text2
    TextPainter measurementUnit = TextPainter(
      text: const TextSpan(
        text: 'km/h ',
        style: AppStyles.regularFootnote,
      ),
      textDirection: TextDirection.ltr,
    );
    measurementUnit.layout();
    double textWidthNextLine = measurementUnit.width;
    double textHeightNextLine = measurementUnit.height;
    double textXNextLine = centerX - textWidthNextLine / 2;
    double textYNextLine = centerY - textHeightNextLine / 2 + 10;
    measurementUnit.paint(canvas, Offset(textXNextLine, textYNextLine));

    // Draw cardinal directions
    drawCardinalDirection(canvas, 'N', centerX, centerY - radius + 15);
    drawCardinalDirection(canvas, 'E', centerX + radius - 15, centerY);
    drawCardinalDirection(canvas, 'S', centerX, centerY + radius - 15);
    drawCardinalDirection(canvas, 'W', centerX - radius + 15, centerY);
  }

  void drawCardinalDirection(Canvas canvas, String text, double x, double y) {
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: AppStyles.regularSubheadline,
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
        canvas, Offset(x - textPainter.width / 2, y - textPainter.height / 2));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
