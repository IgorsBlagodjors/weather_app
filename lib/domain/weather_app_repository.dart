import 'package:weather_app/domain/daily_data_class.dart';
import 'package:weather_app/domain/hourly_data_class.dart';

abstract class WeatherAppRepository {
  Future<List<DailyData>> getDailyData();
  Future<List<HourlyData>> getHourlyData();
}
