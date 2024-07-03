import 'package:flutter/material.dart';
import 'package:weather_app/design_system/app_gradiend.dart';
import 'package:weather_app/presentation/widgets/rectangle.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Expanded(
        child: Container(
          decoration: AppGradient.appBackground,
          child: const Padding(
            padding: EdgeInsets.all(50),
            child: Column(
              children: [
                Rectangle(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
