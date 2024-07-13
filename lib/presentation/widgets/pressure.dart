import 'package:flutter/material.dart';
import 'package:weather_app/design_system/app_colors.dart';
import 'package:weather_app/design_system/app_styles.dart';
import 'package:weather_app/presentation/widgets/weather_details_container.dart';
import 'package:weather_app/presentation/widgets/wind.dart';

class Pressure extends StatelessWidget {
  const Pressure({super.key});

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
                const Icon(Icons.speed,
                    size: 15, color: AppColors.weatherDetailsSubheadline),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  'PRESSURE',
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
