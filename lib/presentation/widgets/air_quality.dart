import 'package:flutter/material.dart';
import 'package:weather_app/design_system/app_colors.dart';
import 'package:weather_app/design_system/app_styles.dart';
import 'package:weather_app/design_system/decorations.dart';
import 'package:weather_app/presentation/widgets/custom_indicator.dart';

class AirQuality extends StatelessWidget {
  const AirQuality({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 168,
      width: 348,
      decoration: AppDecorations.weatherDetailsDecoration,
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.fitbit_outlined,
                  color: AppColors.weatherDetailsSubheadline,
                  size: 15,
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  'AIR QUALITY',
                  style: AppStyles.boldFootnote.copyWith(
                    color: AppColors.weatherDetailsSubheadline,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '3-Low Health Risk',
              style: AppStyles.boldTitle3,
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomIndicator(
              width: 301,
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              color: Color(0xFF323044),
            ),
            const SizedBox(
              height: 7,
            ),
            const Row(
              children: [
                Expanded(
                  child: Text('See more', style: AppStyles.regularBody),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
