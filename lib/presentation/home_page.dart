import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/design_system/app_colors.dart';
import 'package:weather_app/design_system/app_styles.dart';
import 'package:weather_app/presentation/forecast_details_page.dart';
import 'package:weather_app/presentation/widgets/home_page_widgets/custom_bottom_nav_bar.dart';
import 'package:weather_app/presentation/widgets/home_page_widgets/hour_and_week_cont.dart';

class TitlePage extends StatefulWidget {
  const TitlePage({super.key});

  @override
  State<TitlePage> createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
  bool isHourlySelected = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/back.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 98),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WeatherDetailsPage(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Montreal',
                              style: AppStyles.regularLargeTitle,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Text(
                              '19°',
                              style: TextStyle(
                                  height: 0.8,
                                  fontSize: 96,
                                  fontWeight: FontWeight.w200,
                                  color: AppColors.darkPrimary),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              'Mostly Clear',
                              style: AppStyles.boldTitle2.copyWith(
                                color: AppColors.darkSecondary.withOpacity(0.6),
                              ),
                            ),
                            const Text(
                              'H:24° L:18°',
                              style: AppStyles.boldTitle2,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 23,
                        ),
                        Image.asset(
                          'assets/House4_3.png',
                          height: 390,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 500,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [-0.02, 0.54],
                      colors: [
                        const Color(0xFF3A3F54).withOpacity(0),
                        const Color(0xFF3A3F54).withOpacity(0.54),
                      ],
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: HourlyAndWeeklyCont(
                  hourlyList: testListIsNow,
                  weeklyList: testListWeekly,
                  containerHeight: 325,
                  isBorder: true,
                ),
              ),
              const Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: CustomBottomNavBar(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
