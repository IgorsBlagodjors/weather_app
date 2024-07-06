import 'package:flutter/material.dart';
import 'package:weather_app/design_system/app_colors.dart';
import 'package:weather_app/design_system/app_gradiend.dart';
import 'package:weather_app/design_system/app_styles.dart';

class Rectangle extends StatelessWidget {
  const Rectangle({super.key});

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
                const Text(
                  '19°',
                  style: TextStyle(
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
                  'H:24°  L:18°',
                  style: AppStyles.regularFootnote.copyWith(
                    color: AppColors.darkSecondary.withOpacity(0.6),
                  ),
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        'Montreal, Canada',
                        style: AppStyles.regularBody,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 24),
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              'Mid Rain',
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
              'assets/Moon_cloud_mid_rain.png',
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
    var y = size.height;
    var x = size.width;

    var path = Path();
    var paint = Paint()
      ..shader = AppGradient.linear2.createShader(Rect.fromLTWH(0, 0, x, y))
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;

    path.moveTo(0, 30);

    path.lineTo(0, y - 22);

    path.arcToPoint(
      Offset(22, y),
      radius: const Radius.circular(22),
      clockwise: false,
    );
    path.lineTo(x - 22, y);

    path.arcToPoint(
      Offset(x, y - 22),
      radius: const Radius.circular(22),
      clockwise: false,
    );

    path.lineTo(x, y - 80);
    path.arcToPoint(
      Offset(x - 22, y - 105),
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
