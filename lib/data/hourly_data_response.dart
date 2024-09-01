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
        temp: data.temp.toStringAsFixed(0),
        feelslike: data.feelslike.toString(),
        humidity: data.humidity.toStringAsFixed(0),
        windSpeed: data.windSpeed.toStringAsFixed(1),
        windDir: data.windDir,
        pressure: data.pressure,
        visibility: data.visibility.toStringAsFixed(0),
        uvIndex: data.uvIndex.toString(),
        conditions: data.conditions,
        address: address,
        image: setImage(data.conditions),
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
