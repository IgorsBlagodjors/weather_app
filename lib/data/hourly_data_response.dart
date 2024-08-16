import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/domain/hourly_data_class.dart';

part 'hourly_data_response.g.dart';

@JsonSerializable(createToJson: false)
class HourlyDataResponse {
  final String address;
  final List<Days> days;

  HourlyDataResponse({
    required this.days,
    required this.address,
  });

  List<HourlyData> toModel() {
    if (days.isEmpty) return [];
    return days.first.hours.map((data) {
      return HourlyData(
        datetime: DateFormat('HH:mm:ss').parse(data.datetime),
        temp: data.temp,
        feelslike: data.feelslike,
        humidity: data.humidity,
        windSpeed: data.windSpeed,
        windDir: data.windDir,
        pressure: data.pressure,
        visibility: data.visibility,
        uvIndex: data.uvIndex,
        conditions: data.conditions,
        address: address,
      );
    }).toList();
  }

  factory HourlyDataResponse.fromJson(Map<String, dynamic> json) =>
      _$HourlyDataResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class Days {
  final List<Hours> hours;

  Days({
    required this.hours,
  });
  factory Days.fromJson(Map<String, dynamic> json) => _$DaysFromJson(json);
}

@JsonSerializable(createToJson: false)
class Hours {
  final String datetime;
  final double temp;
  final double feelslike;
  final double humidity;
  @JsonKey(name: "windspeed")
  final double windSpeed;
  @JsonKey(name: 'winddir')
  final double windDir;
  final double pressure;
  final double visibility;
  @JsonKey(name: 'uvindex')
  final double uvIndex;
  final String conditions;

  Hours({
    required this.datetime,
    required this.temp,
    required this.feelslike,
    required this.humidity,
    required this.windSpeed,
    required this.windDir,
    required this.pressure,
    required this.visibility,
    required this.uvIndex,
    required this.conditions,
  });
  factory Hours.fromJson(Map<String, dynamic> json) => _$HoursFromJson(json);
}
