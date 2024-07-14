import 'package:flutter/material.dart';
import 'package:weather_app/design_system/app_colors.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/back.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF3A3A6A),
            Color(0xFF25244C),
          ],
        ),
      ),
      child: CustomPaint(
        size: const Size(double.infinity, 100),
        painter: BottomNavBarPainter(),
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
