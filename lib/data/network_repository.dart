import 'package:geolocator/geolocator.dart';
import 'package:weather_app/data/app_api_client.dart';
import 'package:weather_app/domain/daily_data_class.dart';
import 'package:weather_app/domain/hourly_data_class.dart';
import 'package:weather_app/domain/weather_app_repository.dart';

class NetworkRepository implements WeatherAppRepository {
  final ApiClient _weatherApiClient;
  NetworkRepository(this._weatherApiClient);

  @override
  Future<List<DailyData>> getDailyData(Position? position) async {
    bool isPositionEmpty = position == null;

    final response = isPositionEmpty
        ? await _weatherApiClient.getDailyWeatherInfo()
        : await _weatherApiClient.getDailyWeatherInfo(
            location: '${position.latitude},${position.longitude}');
    return response;
  }

  @override
  Future<List<HourlyData>> getHourlyData(Position? position) async {
    bool isPositionEmpty = position == null;
    final response = isPositionEmpty
        ? await _weatherApiClient.getHourlyWeatherInfo()
        : await _weatherApiClient.getHourlyWeatherInfo(
            location: '${position.latitude},${position.longitude}');
    return response;
  }
}
