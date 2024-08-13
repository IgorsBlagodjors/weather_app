import 'package:dio/dio.dart';
import 'package:weather_app/data/api_key.dart';
import 'package:weather_app/data/weather_daily_data_response.dart';
import 'package:weather_app/domain/weather_daily_data_class.dart';

class WeatherApiClient {
  final Dio _dio;
  WeatherApiClient(this._dio);

  Future<List<WeatherDailyData>> getWeatherInfo() async {
    final response = await _dio.get(
        'Latvia/2024-08-12/2024-08-18?unitGroup=metric&key=$weatherApiKey2');
    final fullResponse = WeatherDailyDataResponse.fromJson(response.data);
    print('RRRRRRRRRRRRRRRR $response');
    return fullResponse.toModel();
  }
}
