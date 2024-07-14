import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/design_system/app_colors.dart';
import 'package:weather_app/presentation/widgets/weathe_details_page_widgets/air_quality.dart';
import 'package:weather_app/presentation/widgets/weathe_details_page_widgets/pressure.dart';
import 'package:weather_app/presentation/widgets/weathe_details_page_widgets/sunrise.dart';
import 'package:weather_app/presentation/widgets/weathe_details_page_widgets/uv_index.dart';
import 'package:weather_app/presentation/widgets/weathe_details_page_widgets/weather_details_fixed_size.dart';
import 'package:weather_app/presentation/widgets/weathe_details_page_widgets/wind.dart';

class WeatherDetailsPage extends StatelessWidget {
  const WeatherDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
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
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AirQuality(),
                  SizedBox(
                    height: 10,
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
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Wind(),
                      SizedBox(
                        width: 14,
                      ),
                      WeatherDetailsFixedSize(
                        title: 'RAINFALL',
                        titleIcon: Icons.water_drop,
                        description: '1.2 mm expected in next 24h',
                        indications: '1.8 mm',
                        additionalDescription: 'in last hour',
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WeatherDetailsFixedSize(
                        titleIcon: FontAwesomeIcons.temperatureHalf,
                        title: 'FEELS LIKE',
                        indications: '19°',
                        description: 'Similar to the actual temperature',
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      WeatherDetailsFixedSize(
                        titleIcon: Icons.shower,
                        title: 'HUMIDITY',
                        indications: '90%',
                        description: 'The dew point is 17 right now',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WeatherDetailsFixedSize(
                        titleIcon: Icons.visibility_sharp,
                        title: 'VISIBILITY',
                        indications: '8 km',
                        description: 'Similar to the actual temperature',
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Pressure(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
