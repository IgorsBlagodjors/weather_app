import 'package:weather_app/domain/weather_daily_data_class.dart';

abstract class WeatherAppRepository {
  Future<List<WeatherDailyData>> getDailyData();
}
