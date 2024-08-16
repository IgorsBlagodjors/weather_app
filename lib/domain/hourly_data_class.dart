import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class HourlyData extends Equatable {
  final DateTime datetime;
  final String address;
  final double temp;
  final double feelslike;
  final double humidity;
  final double windSpeed;
  final double windDir;
  final double pressure;
  final double visibility;
  final double uvIndex;
  final String conditions;
  const HourlyData(
      {required this.datetime,
      required this.temp,
      required this.feelslike,
      required this.humidity,
      required this.windSpeed,
      required this.windDir,
      required this.pressure,
      required this.visibility,
      required this.uvIndex,
      required this.conditions,
      required this.address});

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
  String get getTemp {
    return temp.toStringAsFixed(0);
  }

  String get getTime {
    String formattedTime = DateFormat('hh a').format(datetime);
    if (formattedTime.startsWith('0')) {
      return formattedTime.substring(1);
    }
    return formattedTime;
  }

  String get getHumidity {
    return humidity.toStringAsFixed(0);
  }

  String get getAddress {
    String cityName = address.split(',')[0];
    if (cityName.isEmpty) {
      return 'Unknown';
    } else {
      return cityName;
    }
  }

  //  String get getTemp {
  //   return temp.toStringAsFixed(0);
  // }
}
