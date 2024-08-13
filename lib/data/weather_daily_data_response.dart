import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/domain/weather_daily_data_class.dart';

part 'weather_daily_data_response.g.dart';

@JsonSerializable(createToJson: false)
class WeatherDailyDataResponse {
  final List<Day> days;
  WeatherDailyDataResponse({
    required this.days,
  });
  factory WeatherDailyDataResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherDailyDataResponseFromJson(json);

  List<WeatherDailyData> toModel() {
    return days
        .map(
          (daysItem) => WeatherDailyData(
            date: daysItem.datetime,
            temperature: daysItem.temp,
            humidity: daysItem.humidity,
          ),
        )
        .toList();
  }
}

@JsonSerializable(createToJson: false)
class Day {
  final String datetime;
  final double temp;
  final double humidity;

  Day({
    required this.datetime,
    required this.temp,
    required this.humidity,
  });
  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
}
