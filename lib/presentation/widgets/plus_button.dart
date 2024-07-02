import 'package:flutter/material.dart';
import 'package:weather_app/design_system/app_colors.dart';

class PlusButton extends StatelessWidget {
  const PlusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(0, 0, 0, 0.4),
            Color.fromRGBO(255, 255, 255, 0.3),
          ],
          stops: [0.1924, 0.8609],
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(1, 1),
            blurRadius: 0.5,
            color: Colors.white.withOpacity(0.5),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: AppColors.customButtonColors,
              stops: [0.1806, 0.8587],
            ),
            border: Border.all(
              width: 0.2,
              color: Colors.white,
            ),
            boxShadow: [
              const BoxShadow(
                offset: Offset(10, 10),
                blurRadius: 20,
                color: Color.fromRGBO(13, 20, 49, 0.5),
              ),
              BoxShadow(
                offset: const Offset(-10, -10),
                blurRadius: 20,
                color: Colors.white.withOpacity(0.5),
              ),
            ],
          ),
          child: ClipOval(
            child: Container(
              width: 58,
              height: 58,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: AppColors.customButtonColors,
                  stops: [0.1445, 0.8319],
                ),
              ),
              child: FloatingActionButton(
                onPressed: () {},
                child: const Icon(
                  Icons.add,
                  color: AppColors.solid1,
                  size: 32,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
