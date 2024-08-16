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
        temperature: daysItem.temp,
        humidity: daysItem.humidity,
        sunrise: daysItem.sunrise,
        tempMax: daysItem.tempMax,
        tempMin: daysItem.tempMin,
      );
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
  });
  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
}
