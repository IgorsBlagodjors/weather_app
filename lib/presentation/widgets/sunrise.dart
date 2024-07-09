import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/design_system/app_colors.dart';
import 'package:weather_app/design_system/app_styles.dart';
import 'package:weather_app/presentation/widgets/weather_details_container.dart';

class SunRise extends StatelessWidget {
  const SunRise({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final currentTme = DateFormat('h:mm a').format(now);
    return WeatherDetailsContainer(
      width: 164,
      height: 164,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.wb_twighlight,
                      color: AppColors.weatherDetailsSubheadline,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      'SUNRISE',
                      style: AppStyles.boldFootnote.copyWith(
                        color: AppColors.weatherDetailsSubheadline,
                      ),
                    ),
                  ],
                ),
                Text(
                  currentTme,
                  style: const TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.374,
                    color: AppColors.darkPrimary,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 46,
            color: const Color(0xFF282554),
            child: CustomPaint(
              size: const Size(double.infinity, 50),
              painter: SunPainter(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Sunset: 7:25PM ',
              style: AppStyles.regularCallout,
            ),
          ),
        ],
      ),
    );
  }
}

class SunPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final topLineGradient = const LinearGradient(
      colors: [
        Color(0xFF859AC4),
        Color(0xFF13265B),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height / 2));

    final paintTopLine = Paint()
      ..strokeCap = StrokeCap.butt
      ..shader = topLineGradient
      ..color = const Color(0xFF859AC4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5;

    final paintUnderline = Paint()
      ..strokeCap = StrokeCap.butt
      ..color = const Color(0xFF13265B)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5;

    final paintMiddleLane = Paint()
      ..color = const Color(0xFF9E9EA0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final pathUnderline2 = Path();
    pathUnderline2.moveTo(0, size.height);
    pathUnderline2.arcToPoint(
      Offset(size.width / 4, size.height / 2),
      radius: const Radius.circular(100),
      clockwise: false,
    );
    final pathUnderline1 = Path();
    pathUnderline1.moveTo(size.width - size.width / 4, size.height / 2);
    pathUnderline1.arcToPoint(
      Offset(size.width, size.height),
      radius: const Radius.circular(100),
      clockwise: false,
    );
    final pathTopLine = Path();
    pathTopLine.moveTo(size.width / 4, size.height / 2);
    pathTopLine.arcToPoint(
      Offset(size.width / 2.7, size.height / 6),
      radius: const Radius.circular(60),
      clockwise: true,
    );
    pathTopLine.arcToPoint(
      Offset(size.width - size.width / 2.7, size.height / 6),
      radius: const Radius.circular(40),
      clockwise: true,
    );
    pathTopLine.arcToPoint(
      Offset(size.width - size.width / 4, size.height / 2),
      radius: const Radius.circular(40),
      clockwise: true,
    );
    final pathMiddleLane = Path();
    pathMiddleLane.moveTo(0, size.height / 2);
    pathMiddleLane.lineTo(size.width, size.height / 2);

    canvas.drawPath(pathUnderline2, paintUnderline);
    canvas.drawPath(pathUnderline1, paintUnderline);
    canvas.drawPath(pathTopLine, paintTopLine);
    canvas.drawPath(pathMiddleLane, paintMiddleLane);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
