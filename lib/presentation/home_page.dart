import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/design_system/app_colors.dart';
import 'package:weather_app/design_system/app_styles.dart';
import 'package:weather_app/presentation/bloc/home_page_cubit.dart';
import 'package:weather_app/presentation/bloc/home_page_state.dart';
import 'package:weather_app/presentation/widgets/home_page_widgets/custom_bottom_nav_bar.dart';
import 'package:weather_app/presentation/widgets/home_page_widgets/hour_and_week_cont.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  static Widget withCubit() => BlocProvider(
        create: (context) => HomePageCubit(
          context.read(),
        ),
        child: const HomePage(),
      );
}

class _HomePageState extends State<HomePage> {
  late final HomePageCubit _cubit;
  bool isHourlySelected = true;
  String? address;

  @override
  void initState() {
    super.initState();
    _cubit = context.read();
    _cubit.fetchWeather(address);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
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
          final hourlyData = state.hourlyItems;

          child = Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 98),
                child: Center(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            hourlyData.first.getAddress,
                            style: AppStyles.regularLargeTitle,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            '${WeatherServices.getTemp(hourlyData)}°',
                            style: const TextStyle(
                                height: 0.8,
                                fontSize: 96,
                                fontWeight: FontWeight.w200,
                                color: AppColors.darkPrimary),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            WeatherServices.getWeatherCondition(hourlyData),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppStyles.boldTitle2.copyWith(
                              color: AppColors.darkSecondary.withOpacity(0.6),
                            ),
                          ),
                          Text(
                            'H:${WeatherServices.getMinTemp(data)}° L:${WeatherServices.getMaxTemp(data)}°',
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
                  hourlyList: hourlyData,
                  weeklyList: data,
                  containerHeight: 325,
                  isBorder: true,
                  isEllipses: true,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: CustomBottomNavBar(
                  hourlyList: hourlyData,
                  weeklyList: data,
                  isLocationPressed: (bool clicked) async {
                    String address =
                        await WeatherServices.getAddressFromCoordinates();
                    _cubit.fetchWeather(address);
                  },
                ),
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
