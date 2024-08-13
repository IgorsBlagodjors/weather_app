import 'package:weather_app/data/weather_app_api_client.dart';
import 'package:weather_app/domain/weather_app_repository.dart';
import 'package:weather_app/domain/weather_daily_data_class.dart';

class WeatherAppNetworkRepository implements WeatherAppRepository {
  final WeatherApiClient _weatherApiClient;
  WeatherAppNetworkRepository(this._weatherApiClient);

  @override
  Future<List<WeatherDailyData>> getDailyData() async {
    final response = await _weatherApiClient.getWeatherInfo();
    return response;
  }
}
