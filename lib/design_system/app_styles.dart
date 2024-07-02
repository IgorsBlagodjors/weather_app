import 'package:flutter/material.dart';
import 'package:weather_app/design_system/app_colors.dart';

class AppStyles {
  static const regularCaption1 = TextStyle(
    fontFamily: "SF Pro Text",
    fontSize: 12,
    height: 1.0,
    fontWeight: FontWeight.w400,
    color: AppColors.darkPrimary,
  );
  static const regularCaption2 = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.066,
    height: 1.182,
    color: AppColors.darkPrimary,
  );
  static const regularFootnote = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.0,
    letterSpacing: -0.078,
    color: AppColors.darkPrimary,
  );
  static const regularSubheadline = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 15,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 1.3333,
    letterSpacing: -0.24,
    shadows: [
      Shadow(
        color: Color.fromRGBO(0, 0, 0, 0.25),
        offset: Offset(0, 4),
        blurRadius: 4,
      ),
    ],
  );
  static const regularCallout = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 16,
    height: 1.3125,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.32,
    color: AppColors.darkPrimary,
  );
  static const regularBody = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 17,
    height: 1.375,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.408,
    color: AppColors.darkPrimary,
  );
  static const regularHeadline = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 17,
    height: 1.375,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.408,
    color: AppColors.darkPrimary,
  );
  static const regularTitle3 = TextStyle(
    fontSize: 20,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
    letterSpacing: 0.38,
    height: 1.5,
    color: AppColors.darkPrimary,
  );
  static const regularTitle2 = TextStyle(
    fontFamily: 'SF Pro Display',
    fontSize: 22,
    height: 1.75,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.35,
    color: AppColors.darkPrimary,
  );
  static const regularTitle1 = TextStyle(
    fontFamily: 'SF Pro Display',
    height: 2.125,
    fontSize: 28,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.364,
    color: AppColors.darkPrimary,
  );
  static const regularLargeTitle = TextStyle(
    fontFamily: 'SF Pro Display',
    fontSize: 34,
    height: 2.5625,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.374,
    color: AppColors.darkPrimary,
  );
  static const boldCaption2 = TextStyle(
    fontFamily: 'SF Pro Text',
    height: 1.0,
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.06,
    color: AppColors.darkPrimary,
  );
  static const boldCaption1 = TextStyle(
    fontFamily: 'SF Pro Text',
    height: 1.0,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.darkPrimary,
  );
  static const boldFootnote = TextStyle(
    fontSize: 13,
    fontFamily: 'SF Pro Text',
    fontWeight: FontWeight.w600,
    letterSpacing: -0.078,
    //height: 1.38462,
    color: AppColors.darkPrimary,
  );
  static const boldSubheadline = TextStyle(
    fontSize: 15,
    fontFamily: 'SF Pro Text',
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
    //height: 1.3333,
    color: AppColors.darkPrimary,
  );
  static const boldCallout = TextStyle(
    fontFamily: 'SF Pro Text',
    height: 1.3125,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.32,
    color: AppColors.darkPrimary,
  );
  static const boldBody = TextStyle(
    fontFamily: 'SF Pro Text',
    height: 1.375,
    fontSize: 17,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.408,
    color: AppColors.darkPrimary,
  );
  static const boldHeadline = TextStyle(
    fontFamily: 'SF Pro Text',
    height: 1.375,
    fontSize: 17,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.408,
    color: AppColors.darkPrimary,
  );
  static const boldTitle3 = TextStyle(
    fontFamily: 'SF Pro Display',
    height: 1.2,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    //letterSpacing: 0.38,
    color: AppColors.darkPrimary,
  );
  static const boldTitle2 = TextStyle(
    fontFamily: 'SF Pro Display',
    height: 1.5,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.38,
    color: AppColors.darkPrimary,
  );
  static const boldTitle1 = TextStyle(
    fontFamily: 'SF Pro Display',
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.36,
    color: AppColors.darkPrimary,
  );
  static const boldLargeTitle = TextStyle(
    fontFamily: 'SF Pro Display',
    height: 2.5625,
    fontSize: 34,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.374,
    color: AppColors.darkPrimary,
  );
}
