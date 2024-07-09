import 'package:flutter/material.dart';
import 'package:weather_app/design_system/decorations.dart';

class WeatherDetailsContainer extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;

  const WeatherDetailsContainer({
    super.key,
    required this.width,
    required this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: AppDecorations.weatherDetailsDecoration,
      child: child,
    );
  }
}
