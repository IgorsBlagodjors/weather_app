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

  Future<List<DailyData>> getDailyWeatherInfo() async {
    final String date = getWeekDays();
    final response = await _dio
        .get('Riga,Latvia/$date?unitGroup=metric&key=$weatherApiKey3');
    final fullResponse = DailyDataResponse.fromJson(response.data);

    return fullResponse.toModel();
  }

  Future<List<HourlyData>> getHourlyWeatherInfo() async {
    final response = await _dio.get(
        'Riga,Latvia?unitGroup=metric&include=hours&key=$weatherApiKey3&contentType=json');
    final fullResponse = HourlyDataResponse.fromJson(response.data);
    return fullResponse.toModel();
  }
}
