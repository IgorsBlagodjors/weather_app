import 'package:flutter/material.dart';
import 'package:weather_app/design_system/app_gradiend.dart';

class Rectangle extends StatelessWidget {
  const Rectangle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 338,
      height: 184,
      child: CustomPaint(
        foregroundPainter: AnotherPainter(),
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
