import 'package:flutter/material.dart';

class AppGradient {
  static const linear1 = LinearGradient(
    begin: Alignment(0.64, -0.77),
    end: Alignment(-0.64, 0.77),
    colors: [
      Color(0xFF2E335A),
      Color(0xFF1C1B33),
    ],
    stops: [1, 1],
  );
  static const linear2 = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF5936B4),
      Color(0xFF362A84),
    ],
  );
  static const linear3 = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF427BD1),
      Color(0xFFC159EC),
    ],
  );
  static const linear4 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFAEC9FF),
      Color(0xFFAEC9FF),
      Color(0xFF083072),
    ],
  );
  static const radial = RadialGradient(
    center: Alignment(0.3494, 1.0833),
    radius: 1.218,
    colors: [
      Color(0xFFF7CBFD),
      Color(0xFF7758D1),
    ],
  );

  static const appBackground = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment(-1.0, -0.26),
      end: Alignment(0.99, 0.83),
      colors: [
        Color(0xFF2E335A),
        Color(0xFF1C1B33),
      ],
      stops: [0.0162, 0.9572],
    ),
    boxShadow: [
      BoxShadow(
        color: Color.fromRGBO(59, 38, 123, 0.7),
        offset: Offset(40, 60),
        blurRadius: 150,
      ),
    ],
  );
}
