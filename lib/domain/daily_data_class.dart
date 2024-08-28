import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class DailyData extends Equatable {
  final DateTime date;
  final String temperature;
  final String humidity;
  final String sunrise;
  final String tempMin;
  final String tempMax;
  final String conditions;
  final String image;

  const DailyData({
    required this.date,
    required this.temperature,
    required this.humidity,
    required this.sunrise,
    required this.tempMin,
    required this.tempMax,
    required this.conditions,
    required this.image,
  });

  @override
  List<Object?> get props => [
        date,
        temperature,
        humidity,
        sunrise,
      ];

  String get getDate {
    return DateFormat('EEE').format(date).toUpperCase();
  }
}
