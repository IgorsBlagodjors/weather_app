import 'package:flutter/material.dart';
import 'package:weather_app/design_system/app_colors.dart';
import 'package:weather_app/design_system/app_styles.dart';
import 'package:weather_app/presentation/widgets/weathe_details_page_widgets/weather_details_container.dart';

class WeatherDetailsFixedSize extends StatelessWidget {
  final String title;
  final IconData titleIcon;
  final String description;
  final String? additionalDescription;
  final String indications;
  const WeatherDetailsFixedSize({
    super.key,
    required this.title,
    required this.titleIcon,
    required this.description,
    required this.indications,
    this.additionalDescription,
  });

  @override
  Widget build(BuildContext context) {
    return WeatherDetailsContainer(
      width: 164,
      height: 164,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  titleIcon,
                  color: AppColors.weatherDetailsSubheadline,
                  size: 15,
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  title,
                  style: AppStyles.boldFootnote.copyWith(
                    color: AppColors.weatherDetailsSubheadline,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Text(
                indications,
                style: const TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.374,
                  color: AppColors.darkPrimary,
                ),
              ),
            ),
            additionalDescription != null
                ? Text(
                    additionalDescription!,
                    style: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      height: 1.5,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.38,
                      color: AppColors.darkPrimary,
                    ),
                  )
                : const SizedBox.shrink(),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                description,
                style: AppStyles.regularFootnote,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
