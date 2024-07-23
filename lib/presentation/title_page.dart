import 'package:flutter/material.dart';
import 'package:weather_app/design_system/app_colors.dart';
import 'package:weather_app/design_system/app_icons.dart';
import 'package:weather_app/design_system/app_styles.dart';
import 'package:weather_app/presentation/weather_widgets_page.dart';
import 'package:weather_app/presentation/widgets/plus_button.dart';

class TitlePage extends StatefulWidget {
  const TitlePage({super.key});

  @override
  State<TitlePage> createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 98),
                child: Center(
                  child: Column(
                    children: [
                      const Text(
                        'Montreal',
                        style: AppStyles.regularLargeTitle,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        '19°',
                        style: TextStyle(
                            height: 0.8,
                            fontSize: 96,
                            fontWeight: FontWeight.w200,
                            color: AppColors.darkPrimary),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Mostly Clear',
                        style: AppStyles.boldTitle2.copyWith(
                          color: AppColors.darkSecondary.withOpacity(0.6),
                        ),
                      ),
                      const Text(
                        'H:24° L:18°',
                        style: AppStyles.boldTitle2,
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      Image.asset('assets/House4_3.png')
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          onPress: () {},
        ),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  final Function() onPress;
  const CustomBottomNavigationBar({super.key, required this.onPress});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  bool isPressed = false;
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
      child: Stack(
        children: [
          CustomPaint(
            size: const Size(double.infinity, 100),
            painter: BottomNavBarPainter(),
          ),
          Positioned(
            top: (100 - 64) / 2,
            width: MediaQuery.of(context).size.width,
            child: PlusButton(
              onPress: () {},
            ),
          ),
          Positioned(
            left: 32,
            top: 32,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isPressed = !isPressed;
                });
                widget.onPress;
              },
              child: isPressed ? AppIcons.navigationOn : AppIcons.navigationOff,
            ),
          ),
          Positioned(
            right: 32,
            top: 32,
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
