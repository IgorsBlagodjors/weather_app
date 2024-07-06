import 'package:flutter/material.dart';
import 'package:weather_app/design_system/app_colors.dart';
import 'package:weather_app/design_system/decorations.dart';
import 'package:weather_app/presentation/widgets/air_quality.dart';

class WeatherDetailsPage extends StatelessWidget {
  const WeatherDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: const RadialGradient(
              center: Alignment(0.9307, 0.7431),
              radius: 1.1155,
              colors: [
                Color(0xFF45278B),
                Color(0xFF2E335A),
              ],
              stops: [0.0, 1.0],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF4a397f).withOpacity(0.7),
                offset: const Offset(0, 20),
                blurRadius: 100,
              ),
              const BoxShadow(
                color: AppColors.darkPrimary,
                offset: Offset(0, 1),
                blurRadius: 0,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                const AirQuality(),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  children: [
                    Container(
                      height: 164,
                      width: 164,
                      decoration: AppDecorations.weatherDetailsDecoration,
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Container(
                      height: 164,
                      width: 164,
                      decoration: AppDecorations.weatherDetailsDecoration,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
