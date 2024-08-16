// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyDataResponse _$HourlyDataResponseFromJson(Map<String, dynamic> json) =>
    HourlyDataResponse(
      days: (json['days'] as List<dynamic>)
          .map((e) => Days.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: json['address'] as String,
    );

Days _$DaysFromJson(Map<String, dynamic> json) => Days(
      hours: (json['hours'] as List<dynamic>)
          .map((e) => Hours.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Hours _$HoursFromJson(Map<String, dynamic> json) => Hours(
      datetime: json['datetime'] as String,
      temp: (json['temp'] as num).toDouble(),
      feelslike: (json['feelslike'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      windSpeed: (json['windspeed'] as num).toDouble(),
      windDir: (json['winddir'] as num).toDouble(),
      pressure: (json['pressure'] as num).toDouble(),
      visibility: (json['visibility'] as num).toDouble(),
      uvIndex: (json['uvindex'] as num).toDouble(),
      conditions: json['conditions'] as String,
    );
