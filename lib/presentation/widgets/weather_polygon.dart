import 'package:flutter/material.dart';
import 'package:weather_app/design_system/app_colors.dart';
import 'package:weather_app/design_system/app_gradiend.dart';
import 'package:weather_app/design_system/app_styles.dart';

class WeatherPolygon extends StatelessWidget {
  final String indicator;
  final String image;
  final String city;
  final String weatherDescription;
  final String expectedRange;
  const WeatherPolygon({
    super.key,
    required this.indicator,
    required this.image,
    required this.city,
    required this.weatherDescription,
    required this.expectedRange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 342,
      height: 184,
      child: Stack(
        children: [
          CustomPaint(
            size: const Size(348, 184),
            foregroundPainter: AnotherPainter(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 59,
                ),
                Text(
                  indicator,
                  style: const TextStyle(
                    color: AppColors.darkPrimary,
                    fontFamily: 'SF Pro Display',
                    fontSize: 64,
                    fontWeight: FontWeight.w400,
                    height: 41 / 64,
                    letterSpacing: 0.374,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  overflow: TextOverflow.ellipsis,
                  expectedRange,
                  style: AppStyles.regularFootnote.copyWith(
                    color: AppColors.darkSecondary.withOpacity(0.6),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        city,
                        style: AppStyles.regularBody,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 24),
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              weatherDescription,
                              style: AppStyles.regularFootnote,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: -12,
            right: 4,
            child: Image.asset(
              image,
              width: 160,
              height: 160,
            ),
          ),
        ],
      ),
    );
  }
}

class AnotherPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    var paint = Paint()
      ..shader = AppGradient.linear2
          .createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;

    path.moveTo(0, 30);

    path.lineTo(0, size.height - 22);

    path.arcToPoint(
      Offset(22, size.height),
      radius: const Radius.circular(22),
      clockwise: false,
    );
    path.lineTo(size.width - 22, size.height);

    path.arcToPoint(
      Offset(size.width, size.height - 22),
      radius: const Radius.circular(22),
      clockwise: false,
    );

    path.lineTo(size.width, size.height - 80);
    path.arcToPoint(
      Offset(size.width - 22, size.height - 105),
      radius: const Radius.circular(22),
      clockwise: false,
    );

    path.lineTo(30, 15);
    path.arcToPoint(
      const Offset(0, 30),
      radius: const Radius.circular(30),
      clockwise: false,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
