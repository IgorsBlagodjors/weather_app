import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/design_system/app_colors.dart';
import 'package:weather_app/design_system/app_styles.dart';
import 'package:weather_app/presentation/widgets/forecast_details_page_widgets/air_quality.dart';
import 'package:weather_app/presentation/widgets/forecast_details_page_widgets/forecast_details_fixed_size.dart';
import 'package:weather_app/presentation/widgets/forecast_details_page_widgets/pressure.dart';
import 'package:weather_app/presentation/widgets/forecast_details_page_widgets/sunrise.dart';
import 'package:weather_app/presentation/widgets/forecast_details_page_widgets/uv_index.dart';
import 'package:weather_app/presentation/widgets/forecast_details_page_widgets/wind.dart';
import 'package:weather_app/presentation/widgets/home_page_widgets/elipses.dart';
import 'package:weather_app/presentation/widgets/home_page_widgets/hour_and_week_cont.dart';

class WeatherDetailsPage extends StatefulWidget {
  const WeatherDetailsPage({super.key});

  @override
  State<WeatherDetailsPage> createState() => _WeatherDetailsPageState();
}

class _WeatherDetailsPageState extends State<WeatherDetailsPage> {
  bool isHourlySelected = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: const RadialGradient(
                  center: Alignment(0.9307, 0.7431),
                  radius: 1.1155,
                  colors: [
                    Color(0xFF45278B),
                    Color(0xFF2E335A),
                  ],
                  stops: [0.0, 1.0],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF4a397f).withOpacity(0.7),
                    offset: const Offset(0, 20),
                    blurRadius: 100,
                  ),
                  const BoxShadow(
                    color: AppColors.darkPrimary,
                    offset: Offset(0, 1),
                    blurRadius: 0,
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
            CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverContentDelegate(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: double.infinity,
                        color: const Color(0xFF2E335A),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              'Montreal',
                              style: AppStyles.regularLargeTitle,
                            ),
                            Text(
                              '19°| Mostly Clear',
                              style: AppStyles.boldTitle2.copyWith(
                                color: const Color(0xFFebebf5).withOpacity(0.6),
                              ),
                            ),
                            const SizedBox(
                              height: 28,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Column(
                    children: [
                      HourlyAndWeeklyCont(
                        hourlyList: [],
                        weeklyList: [],
                        isBorder: false,
                        isEllipses: false,
                        containerHeight: 1150,
                        additionalChild: const Column(
                          children: [
                            SizedBox(
                              height: 19,
                            ),
                            AirQuality(),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                UvIndex(),
                                SizedBox(
                                  width: 14,
                                ),
                                SunRise(),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Wind(),
                                SizedBox(
                                  width: 14,
                                ),
                                WeatherDetailsFixedSize(
                                  title: 'RAINFALL',
                                  titleIcon: Icons.water_drop,
                                  description: '1.2 mm expected in next 24h',
                                  indications: '1.8 mm',
                                  additionalDescription: 'in last hour',
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WeatherDetailsFixedSize(
                                  titleIcon: FontAwesomeIcons.temperatureHalf,
                                  title: 'FEELS LIKE',
                                  indications: '19°',
                                  description:
                                      'Similar to the actual temperature',
                                ),
                                SizedBox(
                                  width: 14,
                                ),
                                WeatherDetailsFixedSize(
                                  titleIcon: Icons.shower,
                                  title: 'HUMIDITY',
                                  indications: '90%',
                                  description: 'The dew point is 17 right now',
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WeatherDetailsFixedSize(
                                  titleIcon: Icons.visibility_sharp,
                                  title: 'VISIBILITY',
                                  indications: '8 km',
                                  description:
                                      'Similar to the actual temperature',
                                ),
                                SizedBox(
                                  width: 14,
                                ),
                                Pressure(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 110,
              left: 0,
              right: 0,
              child: Stack(
                children: [
                  Container(
                    height: 100,
                  ),
                  Positioned(
                    top: -10,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: AppEllipses.ellipse3,
                    ),
                  ),
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
                    top: 9,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        height: 5,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.lightPrimary.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverContentDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  _SliverContentDelegate({required this.child});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 110.0;

  @override
  double get minExtent => 110.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
