import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class HourlyData extends Equatable {
  final DateTime datetime;
  final String address;
  final String temp;
  final double feelslike;
  final String humidity;
  final String windSpeed;
  final double windDir;
  final double pressure;
  final String visibility;
  final double uvIndex;
  final String conditions;
  final String image;
  const HourlyData({
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
    required this.address,
    required this.image,
  });

  @override
  List<Object?> get props => [
        datetime,
        temp,
        feelslike,
        humidity,
        windSpeed,
        windDir,
        pressure,
        visibility,
        uvIndex,
        conditions,
      ];

  String get getTime {
    String formattedTime = DateFormat('hh a').format(datetime);
    if (formattedTime.startsWith('0')) {
      return formattedTime.substring(1);
    }
    return formattedTime;
  }

  String get getAddress {
    String cityName = address.split(',')[0];
    if (cityName.isEmpty) {
      return 'Unknown';
    } else {
      return cityName;
    }
  }
}
