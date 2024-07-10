import 'package:flutter/material.dart';
import 'package:weather_app/design_system/app_colors.dart';
import 'package:weather_app/presentation/widgets/air_quality.dart';
import 'package:weather_app/presentation/widgets/sunrise.dart';
import 'package:weather_app/presentation/widgets/uv_index.dart';
import 'package:weather_app/presentation/widgets/weather_details_container.dart';
import 'package:weather_app/presentation/widgets/wind.dart';

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
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AirQuality(),
              SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UvIndex(),
                  SizedBox(
                    width: 14,
                  ),
                  SunRise(),
                ],
              ),
              SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Wind(),
                  SizedBox(
                    width: 14,
                  ),
                  WeatherDetailsContainer(
                    width: 164,
                    height: 164,
                    child: Text('zz'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
