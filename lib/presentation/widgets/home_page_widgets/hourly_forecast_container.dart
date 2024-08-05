import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/design_system/app_colors.dart';
import 'package:weather_app/design_system/app_styles.dart';

class HourlyForecastContainer extends StatelessWidget {
  final String hour;
  final int degree;
  final int? label;
  final String weatherIcon;

  const HourlyForecastContainer({
    super.key,
    required this.hour,
    required this.degree,
    required this.label,
    required this.weatherIcon,
  });

  @override
  Widget build(BuildContext context) {
    bool activated = hour == getTime() || hour == getDay();

    return Container(
      height: 146,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: activated
              ? AppColors.darkPrimary.withOpacity(0.50)
              : AppColors.darkPrimary.withOpacity(0.2),
          width: 1,
        ),
        color: activated ? AppColors.solid1 : AppColors.solid1.withOpacity(0.2),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkPrimary.withOpacity(0.25),
            offset: const Offset(1, 1),
            blurRadius: 0,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: AppColors.lightPrimary.withOpacity(0.25),
            offset: const Offset(5, 4),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  hour,
                  style: AppStyles.boldSubheadline,
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: 44,
                  height: 36,
                  color: activated
                      ? AppColors.solid1
                      : AppColors.solid1.withOpacity(0.2),
                  child: Transform.translate(
                    offset: const Offset(0, 2),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: label != null
                          ? Text(
                              textAlign: TextAlign.center,
                              '$label %',
                              style: AppStyles.boldFootnote.copyWith(
                                color: AppColors.labelColor,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  '$degree°',
                  style: AppStyles.boldTitle3,
                ),
              ],
            ),
          ),
          Positioned(
            top: 48,
            child: Image.asset(
              weatherIcon,
              width: 32,
              height: 32,
            ),
          ),
        ],
      ),
    );
  }
}
