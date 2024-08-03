import 'package:flutter/material.dart';
import 'package:weather_app/design_system/app_colors.dart';
import 'package:weather_app/design_system/app_icons.dart';
import 'package:weather_app/presentation/forecast_details_page.dart';
import 'package:weather_app/presentation/weather_widgets_page.dart';
import 'package:weather_app/presentation/widgets/home_page_widgets/plus_button.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF3a3a6a).withOpacity(0.26),
            const Color(0xFF25244c).withOpacity(0.26),
          ],
          stops: const [0, 1],
        ),
      ),
      child: Stack(
        children: [
          CustomPaint(
            size: const Size(double.infinity, 100),
            painter: BottomNavBarPainter(),
          ),
          Positioned(
            bottom: 24,
            width: MediaQuery.of(context).size.width,
            child: PlusButton(
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WeatherDetailsPage(),
                  ),
                );
              },
            ),
          ),
          Positioned(
            left: 32,
            bottom: 24,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isPressed = !isPressed;
                });
              },
              child: isPressed ? AppIcons.navigationOn : AppIcons.navigationOff,
            ),
          ),
          Positioned(
            right: 32,
            bottom: 24,
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WeatherWidgetsPage(),
                    ),
                  );
                },
                child: AppIcons.list),
          ),
        ],
      ),
    );
  }
}

class BottomNavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    Paint paintStroke = Paint()
      ..color = AppColors.customBottomNav.withOpacity(0.5)
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;

    Paint paintFill = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xFF262C51),
          Color(0xFF3e3f74),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..strokeWidth = 0.5
      ..style = PaintingStyle.fill;

    Path stroke = Path();
    stroke.moveTo(0, size.height - 88);
    stroke.arcToPoint(
      Offset(size.width, size.height - 88),
      radius: const Radius.circular(1100),
      clockwise: false,
    );

    Path middleStroke = Path();
    middleStroke.moveTo(centerX, 0);
    middleStroke.lineTo(centerX - 258 / 2 + 100, 0);
    middleStroke.arcToPoint(
      Offset(centerX - 258 / 2 + 58, centerY),
      radius: const Radius.circular(50),
      clockwise: false,
    );
    middleStroke.arcToPoint(
      Offset(centerX - 258 / 2, size.height),
      radius: const Radius.circular(60),
      clockwise: true,
    );
    middleStroke.moveTo(centerX, 0);
    middleStroke.lineTo(centerX + 258 / 2 - 100, 0);
    middleStroke.arcToPoint(
      Offset(centerX + 258 / 2 - 58, centerY),
      radius: const Radius.circular(50),
      clockwise: true,
    );
    middleStroke.arcToPoint(
      Offset(centerX + 258 / 2, size.height),
      radius: const Radius.circular(60),
      clockwise: false,
    );

    //Fill
    Path fill = Path();
    fill.moveTo(centerX, 0);
    fill.lineTo(centerX - 258 / 2 + 100, 0);
    fill.arcToPoint(
      Offset(centerX - 258 / 2 + 58, centerY),
      radius: const Radius.circular(50),
      clockwise: false,
    );
    fill.arcToPoint(
      Offset(centerX - 258 / 2, size.height),
      radius: const Radius.circular(60),
      clockwise: true,
    );
    fill.lineTo(centerX + 258 / 2, size.height);
    fill.arcToPoint(
      Offset(centerX + 258 / 2 - 58, centerY),
      radius: const Radius.circular(60),
      clockwise: true,
    );
    fill.arcToPoint(
      Offset(centerX + 258 / 2 - 100, 0),
      radius: const Radius.circular(60),
      clockwise: false,
    );

    fill.lineTo(centerX, 0);
    canvas.drawPath(stroke, paintStroke);
    canvas.drawPath(middleStroke, paintStroke);
    canvas.drawPath(middleStroke, paintStroke);
    canvas.drawPath(fill, paintFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
