import 'package:flutter/material.dart';

class AppEllipses {
  static final ellipse2 = Container(
    height: 32,
    width: 286,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          blurRadius: 60,
          spreadRadius: 5,
          color: const Color(0xFFC427FB).withOpacity(0.5),
        ),
      ],
    ),
  );
  static final ellipse3 = Container(
    width: 286,
    height: 9.891,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      boxShadow: [
        BoxShadow(
          blurRadius: 10,
          spreadRadius: 0,
          color: Color(0xFFE0D9FF),
        ),
      ],
    ),
  );
}
