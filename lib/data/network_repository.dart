import 'package:geolocator/geolocator.dart';
import 'package:weather_app/data/app_api_client.dart';
import 'package:weather_app/domain/daily_data_class.dart';
import 'package:weather_app/domain/hourly_data_class.dart';
import 'package:weather_app/domain/weather_app_repository.dart';

class NetworkRepository implements WeatherAppRepository {
  final ApiClient _weatherApiClient;
  NetworkRepository(this._weatherApiClient);

  @override
  Future<List<DailyData>> getDailyData(String? address) async {
    bool isAddressEmpty = address == null;

    final response = isAddressEmpty
        ? await _weatherApiClient.getDailyWeatherInfo()
        : await _weatherApiClient.getDailyWeatherInfo(location: address);
    return response;
  }

  @override
  Future<List<HourlyData>> getHourlyData(String? address) async {
    bool isPositionEmpty = address == null;
    final response = isPositionEmpty
        ? await _weatherApiClient.getHourlyWeatherInfo()
        : await _weatherApiClient.getHourlyWeatherInfo(location: address);
    return response;
  }
}
