import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/domain/daily_data_class.dart';

part 'daily_data_response.g.dart';

@JsonSerializable(createToJson: false)
class DailyDataResponse {
  final List<Day> days;

  DailyDataResponse({
    required this.days,
  });

  List<DailyData> toModel() {
    return days.map((daysItem) {
      return DailyData(
          date: DateTime.parse(daysItem.datetime),
          temperature: daysItem.temp.toStringAsFixed(0),
          humidity: daysItem.humidity.toStringAsFixed(0),
          sunrise: DateTime.parse(daysItem.sunrise),
          tempMax: daysItem.tempMax.toStringAsFixed(0),
          tempMin: daysItem.tempMin.toStringAsFixed(0),
          conditions: daysItem.conditions,
          image: setImage(daysItem.conditions));
    }).toList();
  }

  factory DailyDataResponse.fromJson(Map<String, dynamic> json) =>
      _$DailyDataResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class Day {
  final String datetime;
  final double temp;
  final double humidity;
  final String sunrise;
  final String conditions;
  @JsonKey(name: 'tempmin')
  final double tempMin;
  @JsonKey(name: 'tempmax')
  final double tempMax;

  Day({
    required this.datetime,
    required this.temp,
    required this.humidity,
    required this.sunrise,
    required this.tempMin,
    required this.tempMax,
    required this.conditions,
  });
  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
}

String setImage(String conditions) {
  if (conditions == "Clear") {
    return 'assets/sunny32x32.png';
  } else if (conditions == "Rain, Overcast") {
    return 'assets/Moon_cloud_mid_rain32x32.png';
  } else if (conditions == "Overcast") {
    return 'assets/Moon_cloud_fast_wind32x32.png';
  } else if (conditions == "Partially cloudy") {
    return 'assets/Sun_cloud_angled_rain32x32.png';
  } else if (conditions == "Rain, Partially cloudy") {
    return 'assets/Sun_cloud_mid_rain32x32.png';
  }
  return 'assets/Tornado32x32';
}
