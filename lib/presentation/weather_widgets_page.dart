import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/design_system/app_colors.dart';
import 'package:weather_app/design_system/app_gradiend.dart';
import 'package:weather_app/design_system/app_icons.dart';
import 'package:weather_app/design_system/app_styles.dart';
import 'package:weather_app/presentation/widgets/weather_polygon.dart';

class WeatherWidgetsPage extends StatelessWidget {
  const WeatherWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: AppGradient.linear1,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFEBEBF5).withOpacity(0.7),
                      offset: const Offset(40, 60),
                      blurRadius: 150,
                      spreadRadius: 0,
                    )
                  ],
                ),
              ),
              CustomScrollView(
                slivers: [
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _SliverAppBarDelegate(
                      child: Stack(
                        children: [
                          ClipRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: const SizedBox(
                                width: double.infinity,
                                height: 120,
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.transparent,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                          size: 23,
                                          color: AppColors.darkSecondary
                                              .withOpacity(0.6),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      const Expanded(
                                        child: Text(
                                          'Weather',
                                          style: AppStyles.regularTitle1,
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) => GestureDetector(
                                          onTap: () {
                                            //TODO": made AppBarHouseIcon activity
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content:
                                                    Text('Under Construction'),
                                              ),
                                            );
                                          },
                                          child: AppIcons.appBarHouse,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 17),
                                  Container(
                                    width: double.infinity,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          const Color(0xFF2E335A)
                                              .withOpacity(0.26),
                                          const Color(0xFF1C1B33)
                                              .withOpacity(0.2),
                                        ],
                                        stops: const [0.0162, 0.9572],
                                        transform: const GradientRotation(
                                            168 * 3.14159 / 180),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.25),
                                          offset: const Offset(0, 4),
                                          blurRadius: 4,
                                          spreadRadius: 0,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: TextFormField(
                                        style: AppStyles.regularBody.copyWith(
                                          color: AppColors.darkSecondary
                                              .withOpacity(0.6),
                                        ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText:
                                              'Search for a city or airport',
                                          hintStyle:
                                              AppStyles.regularBody.copyWith(
                                            color: AppColors.darkSecondary
                                                .withOpacity(0.6),
                                          ),
                                          prefixIcon: Icon(
                                            Icons.search,
                                            color: AppColors.darkSecondary
                                                .withOpacity(0.6),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: WeatherPolygon(
                            image: weatherList[index]['image'],
                            indicator: weatherList[index]['indicator'],
                            city: weatherList[index]['city'],
                            expectedRange: weatherList[index]['expectedRange'],
                            weatherDescription: weatherList[index]
                                ['weatherDescription'],
                          ),
                        ),
                      ),
                      childCount: weatherList.length,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _SliverAppBarDelegate({required this.child});
  @override
  double get minExtent => 120.0;

  @override
  double get maxExtent => 120.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
