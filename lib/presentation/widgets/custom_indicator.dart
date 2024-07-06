import 'package:flutter/material.dart';
import 'package:weather_app/design_system/app_colors.dart';

class CustomIndicator extends StatelessWidget {
  final double width;
  const CustomIndicator({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
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
            width: width / 4 - 10,
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
