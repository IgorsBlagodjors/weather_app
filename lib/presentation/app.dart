import 'package:flutter/material.dart';
import 'package:weather_app/presentation/widgets/app_containers.dart';
import 'package:weather_app/presentation/widgets/plus_button.dart';

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
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFF2E335A),
              Color(0xFF1C1B33),
            ],
            stops: [0.0162, 0.9572],
            transform: GradientRotation(168 * 3.14159 / 180),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(40, 60),
              blurRadius: 150,
              spreadRadius: 0,
              color: Color.fromRGBO(59, 38, 123, 0.70),
            ),
          ],
        ),
        child: const Column(
          children: [
            HourlyForecastContainer(
              isNow: true,
              hour: '12 AM',
              degree: 19,
              label: 30,
              weatherIcon: 'assets/Moon_cloud_mid_rain32x32.png',
            ),
            HourlyForecastContainer(
              isNow: false,
              hour: '12 AM',
              degree: 19,
              label: null,
              weatherIcon: 'assets/Tornado32x32.png',
            ),
            PlusButton(),
            Icon(
              Icons.list_sharp,
              color: Colors.white,
              size: 48,
            ),
          ],
        ),
      ),
    );
  }
}
