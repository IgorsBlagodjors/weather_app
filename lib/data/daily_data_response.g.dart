// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyDataResponse _$DailyDataResponseFromJson(Map<String, dynamic> json) =>
    DailyDataResponse(
      days: (json['days'] as List<dynamic>)
          .map((e) => Day.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Day _$DayFromJson(Map<String, dynamic> json) => Day(
      datetime: json['datetime'] as String,
      temp: (json['temp'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      sunrise: json['sunrise'] as String,
      tempMin: (json['tempmin'] as num).toDouble(),
      tempMax: (json['tempmax'] as num).toDouble(),
    );
