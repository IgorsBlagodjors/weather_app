import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/design_system/app_colors.dart';
import 'package:weather_app/design_system/app_styles.dart';
import 'package:weather_app/presentation/bloc/weather_home_page_cubit.dart';
import 'package:weather_app/presentation/bloc/weather_home_page_state.dart';
import 'package:weather_app/presentation/widgets/home_page_widgets/custom_bottom_nav_bar.dart';
import 'package:weather_app/presentation/widgets/home_page_widgets/hour_and_week_cont.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  static Widget withCubit() => BlocProvider(
        create: (context) => WeatherHomePageCubit(
          context.read(),
        ),
        child: const HomePage(),
      );
}

class _HomePageState extends State<HomePage> {
  late final WeatherHomePageCubit _cubit;

  bool isHourlySelected = true;

  @override
  void initState() {
    super.initState();
    _cubit = context.read();
    _cubit.fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherHomePageCubit, WeatherHomePageState>(
      builder: (context, state) {
        Widget? child;
        if (state.isLoading) {
          child = const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.isError) {
          child = const Center(
            child: Text('Failure error'),
          );
        } else {
          final data = state.items;
          child = Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 98),
                child: Center(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {});
                            },
                            child: const Text(
                              'Montreal',
                              style: AppStyles.regularLargeTitle,
                            ),
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
                  weeklyList: data,
                  containerHeight: 325,
                  isBorder: true,
                  isEllipses: true,
                ),
              ),
              const Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: CustomBottomNavBar(),
              ),
            ],
          );
        }
        return SafeArea(
          child: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/back.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
