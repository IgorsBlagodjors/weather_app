import 'package:flutter/material.dart';
import 'package:weather_app/design_system/app_colors.dart';
import 'package:weather_app/design_system/app_styles.dart';
import 'package:weather_app/presentation/widgets/app_containers.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  bool isHourlySelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 9,
          ),
          Container(
            height: 5,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.lightPrimary.withOpacity(0.5),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isHourlySelected = true;
                  });
                },
                child: Text(
                  'Hourly Forecast',
                  style: AppStyles.regularSubheadline.copyWith(
                    color: const Color(0xFFEBEBF5).withOpacity(0.6),
                  ),
                ),
              ),
              const SizedBox(
                width: 100,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isHourlySelected = false;
                  });
                },
                child: Text(
                  'Weekly Forecast',
                  style: AppStyles.regularSubheadline.copyWith(
                    color: const Color(0xFFEBEBF5).withOpacity(0.6),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            height: 3,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: isHourlySelected
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                end: isHourlySelected
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                colors: [
                  AppColors.darkPrimary.withOpacity(0),
                  AppColors.darkPrimary,
                  AppColors.darkPrimary.withOpacity(0),
                ],
                stops: const [
                  0.5731,
                  0.7897,
                  0.9744,
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 1,
            decoration: BoxDecoration(
              color: AppColors.darkPrimary.withOpacity(0.3),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 1),
                  blurRadius: 0,
                  spreadRadius: 0,
                  color: AppColors.lightPrimary.withOpacity(0.2),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 146,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => const HourlyForecastContainer(
                  isNow: true,
                  hour: '12 AM',
                  degree: 19,
                  label: 30,
                  weatherIcon: 'assets/Sun_cloud_angled_rain32x32.png',
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 8,
                ),
                itemCount: 4,
              ),
            ),
          ),
          HourlyForecastContainer(
            isNow: false,
            hour: '12 AM',
            degree: 19,
            label: 30,
            weatherIcon: 'assets/Sun_cloud_angled_rain32x32.png',
          ),
        ],
      ),
    );
  }
}
