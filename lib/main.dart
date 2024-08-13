import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/weather_app_api_client.dart';
import 'package:weather_app/data/weather_app_network_repository.dart';
import 'package:weather_app/domain/weather_app_repository.dart';
import 'package:weather_app/presentation/home_page.dart';

void main() {
  final dio = Dio(
    BaseOptions(
      baseUrl:
          'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/',
    ),
  );
  dio.interceptors.add(
    LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
    ),
  );
  final weatherApiClient = WeatherApiClient(dio);
  final networkWeatherRepository =
      WeatherAppNetworkRepository(weatherApiClient);
  final networkRepositoryProvider = RepositoryProvider<WeatherAppRepository>(
    create: (context) => networkWeatherRepository,
  );
  runApp(
    MultiRepositoryProvider(
      providers: [
        networkRepositoryProvider,
      ],
      child: MaterialApp(
        home: HomePage.withCubit(),
      ),
    ),
  );
}
