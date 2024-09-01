import 'package:flutter/material.dart';
import 'package:weather_app/design_system/app_colors.dart';
import 'package:weather_app/design_system/app_styles.dart';
import 'package:weather_app/presentation/widgets/forecast_details_page_widgets/custom_indicator.dart';
import 'package:weather_app/presentation/widgets/forecast_details_page_widgets/forecast_details_container.dart';

class UvIndex extends StatelessWidget {
  final String uVIndex;
  const UvIndex({
    super.key,
    required this.uVIndex,
  });

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
                const Icon(
                  Icons.wb_sunny,
                  color: AppColors.weatherDetailsSubheadline,
                  size: 15,
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  'UV INDEX',
                  style: AppStyles.boldFootnote.copyWith(
                    color: AppColors.weatherDetailsSubheadline,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              uVIndex,
              style: const TextStyle(
                fontFamily: 'SF Pro Display',
                fontSize: 32,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.374,
                color: AppColors.darkPrimary,
              ),
            ),
            const Text(
              'Moderate',
              style: AppStyles.boldTitle2,
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomIndicator(
              width: 120,
              indicatorPosition: 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
