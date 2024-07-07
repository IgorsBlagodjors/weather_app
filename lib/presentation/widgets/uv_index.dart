import 'package:flutter/material.dart';
import 'package:weather_app/design_system/app_colors.dart';
import 'package:weather_app/design_system/app_styles.dart';
import 'package:weather_app/design_system/decorations.dart';
import 'package:weather_app/presentation/widgets/custom_indicator.dart';

class UvIndex extends StatelessWidget {
  const UvIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 164,
      width: 164,
      decoration: AppDecorations.weatherDetailsDecoration,
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
            const Text(
              '4',
              style: TextStyle(
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
