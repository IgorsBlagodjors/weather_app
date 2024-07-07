import 'package:flutter/material.dart';
import 'package:weather_app/design_system/app_colors.dart';

class CustomIndicator extends StatelessWidget {
  final double width;
  final double indicatorPosition;
  const CustomIndicator(
      {super.key, required this.width, required this.indicatorPosition});

  @override
  Widget build(BuildContext context) {
    double indicator = width * indicatorPosition;
    return Container(
      width: width,
      height: 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(colors: [
          Color(0xFF3658B0),
          Color(0xFFE64397),
        ], begin: Alignment.centerLeft, end: Alignment.bottomRight),
      ),
      child: Row(
        children: [
          SizedBox(
            width: indicator - 10,
          ),
          const CircleAvatar(
            radius: 5,
            backgroundColor: AppColors.darkPrimary,
          ),
        ],
      ),
    );
  }
}
