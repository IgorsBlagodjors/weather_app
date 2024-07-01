import 'package:flutter/material.dart';
import 'package:weather_app/presentation/widgets/app_containers.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.8607, 0.4862),
            radius: 1.0,
            focal: Alignment(0.8607, 0.4862),
            focalRadius: 0.7319,
            colors: [
              Color(0xFF45278B),
              Color(0xFF2E335A),
            ],
            stops: [0.0, 1.0],
          ),
        ),
        child: const Column(
          children: [
            HourlyForecastContainer(
              isNow: true,
              hour: '12 AM',
              degree: 19,
              label: 30,
              weatherIcon: 'assets/Moon_cloud_mid_rain.png',
            ),
            HourlyForecastContainer(
              isNow: false,
              hour: '12 AM',
              degree: 19,
              label: null,
              weatherIcon: 'assets/Moon_cloud_mid_rain.png',
            ),
          ],
        ),
      ),
    );
  }
}
