// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_daily_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDailyDataResponse _$WeatherDailyDataResponseFromJson(
        Map<String, dynamic> json) =>
    WeatherDailyDataResponse(
      days: (json['days'] as List<dynamic>)
          .map((e) => Day.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Day _$DayFromJson(Map<String, dynamic> json) => Day(
      datetime: json['datetime'] as String,
      temp: (json['temp'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
    );
