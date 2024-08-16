import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class DailyData extends Equatable {
  final DateTime date;
  final double temperature;
  final double humidity;
  final String sunrise;
  final double tempMin;
  final double tempMax;

  const DailyData({
    required this.date,
    required this.temperature,
    required this.humidity,
    required this.sunrise,
    required this.tempMin,
    required this.tempMax,
  });

  @override
  List<Object?> get props => [
        date,
        temperature,
        humidity,
        sunrise,
      ];
  String get getTemp {
    return temperature.toStringAsFixed(0);
  }

  String get getTempMin {
    return tempMin.toStringAsFixed(0);
  }

  String get getTempMax {
    return tempMax.toStringAsFixed(0);
  }

  String get getHumidity {
    return humidity.toStringAsFixed(0);
  }

  String get getDate {
    return DateFormat('EEE').format(date).toUpperCase();
  }
}
