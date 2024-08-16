import 'package:weather_app/data/app_api_client.dart';
import 'package:weather_app/domain/daily_data_class.dart';
import 'package:weather_app/domain/hourly_data_class.dart';
import 'package:weather_app/domain/weather_app_repository.dart';

class NetworkRepository implements WeatherAppRepository {
  final ApiClient _weatherApiClient;
  NetworkRepository(this._weatherApiClient);

  @override
  Future<List<DailyData>> getDailyData() async {
    final response = await _weatherApiClient.getDailyWeatherInfo();
    print('DAILY $response');
    return response;
  }

  @override
  Future<List<HourlyData>> getHourlyData() async {
    final response = await _weatherApiClient.getHourlyWeatherInfo();
    print('HOURLY $response');
    return response;
  }
}
