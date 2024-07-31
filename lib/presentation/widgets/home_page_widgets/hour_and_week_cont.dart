import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/design_system/app_colors.dart';
import 'package:weather_app/design_system/app_styles.dart';
import 'package:weather_app/presentation/widgets/app_containers.dart';
import 'package:weather_app/presentation/widgets/home_page_widgets/elipses.dart';

class HourlyAndWeeklyCont extends StatefulWidget {
  final List<Map<String, dynamic>> hourlyList;
  final List<Map<String, dynamic>> weeklyList;
  final bool isBorder;
  final Widget? additionalChild;
  final double containerHeight;
  const HourlyAndWeeklyCont({
    super.key,
    required this.hourlyList,
    required this.weeklyList,
    required this.containerHeight,
    required this.isBorder,
    this.additionalChild,
  });

  @override
  State<HourlyAndWeeklyCont> createState() => _HourlyAndWeeklyContState();
}

class _HourlyAndWeeklyContState extends State<HourlyAndWeeklyCont> {
  bool isHourlySelected = true;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
        child: Container(
          height: widget.containerHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [-0.046, 0.9545],
              colors: [
                const Color(0xFF2E335A).withOpacity(0.26),
                const Color(0xFF1C1B33).withOpacity(0.26),
              ],
            ),
            borderRadius: widget.isBorder
                ? const BorderRadius.only(
                    topLeft: Radius.circular(44),
                    topRight: Radius.circular(44),
                  )
                : null,
            border: widget.isBorder
                ? Border.all(
                    width: 1,
                    color: AppColors.lightPrimary,
                  )
                : null,
          ),
          child: Stack(
            children: [
              Positioned(
                top: -33,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: AppEllipses.ellipse2,
                ),
              ),
              Positioned(
                top: -10,
                left: 0,
                right: 0,
                child: Align(
                    alignment: Alignment.topCenter,
                    child: AppEllipses.ellipse3),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 9,
                    ),
                    Container(
                      height: 5,
                      width: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.lightPrimary.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isHourlySelected = true;
                            });
                          },
                          child: Text(
                            'Hourly Forecast',
                            style: AppStyles.regularSubheadline.copyWith(
                              color: const Color(0xFFEBEBF5).withOpacity(0.6),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isHourlySelected = false;
                            });
                          },
                          child: Text(
                            'Weekly Forecast',
                            style: AppStyles.regularSubheadline.copyWith(
                              color: const Color(0xFFEBEBF5).withOpacity(0.6),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: double.infinity,
                      height: 3,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: isHourlySelected
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          end: isHourlySelected
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          colors: [
                            AppColors.darkPrimary.withOpacity(0),
                            AppColors.darkPrimary,
                            AppColors.darkPrimary.withOpacity(0),
                          ],
                          stops: const [
                            0.5731,
                            0.7897,
                            0.9744,
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      decoration: BoxDecoration(
                        color: AppColors.darkPrimary.withOpacity(0.3),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 1),
                            blurRadius: 0,
                            spreadRadius: 0,
                            color: AppColors.lightPrimary.withOpacity(0.2),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 19,
                        left: 20,
                      ),
                      child: SizedBox(
                        height: 146,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              HourlyForecastContainer(
                            isNow: isHourlySelected
                                ? widget.hourlyList[index]['isNow']
                                : widget.weeklyList[index]['isNow'],
                            hour: isHourlySelected
                                ? widget.hourlyList[index]['hour']
                                : widget.weeklyList[index]['hour'],
                            degree: isHourlySelected
                                ? widget.hourlyList[index]['degree']
                                : widget.weeklyList[index]['degree'],
                            label: isHourlySelected
                                ? widget.hourlyList[index]['label']
                                : widget.weeklyList[index]['label'],
                            weatherIcon: isHourlySelected
                                ? widget.hourlyList[index]['weatherIcon']
                                : widget.weeklyList[index]['weatherIcon'],
                          ),
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 8,
                          ),
                          itemCount: isHourlySelected
                              ? widget.hourlyList.length
                              : widget.weeklyList.length,
                        ),
                      ),
                    ),
                    widget.additionalChild != null
                        ? widget.additionalChild!
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
