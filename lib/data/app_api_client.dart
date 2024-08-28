import 'package:dio/dio.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/data/api_key.dart';
import 'package:weather_app/data/daily_data_response.dart';
import 'package:weather_app/data/hourly_data_response.dart';
import 'package:weather_app/domain/daily_data_class.dart';
import 'package:weather_app/domain/hourly_data_class.dart';

class ApiClient {
  final Dio _dio;
  ApiClient(this._dio);

  Future<List<DailyData>> getDailyWeatherInfo({
    String location = 'Moscow,Russia',
  }) async {
    final String date = getWeekDays();

    final queryParams = {
      'unitGroup': 'metric',
      'key': ApiKey.weatherApiKey2,
    };
    final response =
        await _dio.get('$location/$date', queryParameters: queryParams);
    final fullResponse = DailyDataResponse.fromJson(response.data);

    return fullResponse.toModel();
  }

  Future<List<HourlyData>> getHourlyWeatherInfo({
    String location = 'Moscow,Russia',
  }) async {
    final queryParams = {
      'unitGroup': 'metric',
      'include': 'hours',
      'key': ApiKey.weatherApiKey2,
      'contentType': 'json'
    };
    final response = await _dio.get(location, queryParameters: queryParams);
    final fullResponse = HourlyDataResponse.fromJson(response.data);
    return fullResponse.toModel();
  }
}
