import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/design_system/app_gradiend.dart';
import 'package:weather_app/presentation/widgets/weather_polygon.dart';

class WeatherWidgetsPage extends StatelessWidget {
  const WeatherWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: AppGradient.linear1,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF3b267b).withOpacity(0.7),
                offset: const Offset(40, 60),
                blurRadius: 150,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: SizedBox(
                width: 342,
                child: ListView.separated(
                  itemBuilder: (context, index) => WeatherPolygon(
                    image: weatherList[index]['image'],
                    indicator: weatherList[index]['indicator'],
                    city: weatherList[index]['city'],
                    expectedRange: weatherList[index]['expectedRange'],
                    weatherDescription: weatherList[index]
                        ['weatherDescription'],
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                  itemCount: weatherList.length,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
