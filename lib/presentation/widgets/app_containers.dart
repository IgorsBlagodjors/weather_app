import 'package:flutter/material.dart';
import 'package:weather_app/design_system/app_colors.dart';
import 'package:weather_app/design_system/app_styles.dart';

class HourlyForecastContainer extends StatelessWidget {
  final bool isNow;

  final String hour;
  final int degree;
  final int? label;
  final String weatherIcon;
  const HourlyForecastContainer({
    super.key,
    required this.isNow,
    required this.hour,
    required this.degree,
    required this.label,
    required this.weatherIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 146,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: isNow
              ? AppColors.activeDecorationBorderColor
              : AppColors.defaultDecorationBorderColor,
          width: 1,
        ),
        color: isNow ? AppColors.solid1 : AppColors.defaultDecorationColor1,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(255, 255, 255, 0.25),
            offset: Offset(1, 1),
            blurRadius: 0,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(5, 4),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
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
                padding: const EdgeInsets.only(
                  top: 22,
                ),
                width: 44,
                height: 38,
                color: isNow
                    ? AppColors.solid1
                    : AppColors.defaultDecorationColor1,
                child: Center(
                  child: label != null
                      ? Text(
                          '$label %',
                          style: AppStyles.boldFootnote.copyWith(
                            color: const Color(0xFF40CBD8),
                          ),
                        )
                      : null,
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
          Positioned(
            top: 48,
            child: Image.asset(
              weatherIcon,
              width: 32,
              height: 32,
            ),
          )
        ],
      ),
    );
  }
}
