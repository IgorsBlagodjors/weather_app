import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/weather_daily_data_class.dart';

class WeatherHomePageState extends Equatable {
  final List<WeatherDailyData> items;
  final bool isLoading;
  final bool isError;

  const WeatherHomePageState({
    required this.items,
    required this.isLoading,
    required this.isError,
  });

  WeatherHomePageState copyWith({
    List<WeatherDailyData>? items,
    bool? isLoading,
    bool? isError,
  }) =>
      WeatherHomePageState(
        items: items ?? this.items,
        isLoading: isLoading ?? this.isLoading,
        isError: isError ?? this.isError,
      );

  @override
  List<Object?> get props => [
        items,
        isLoading,
        isError,
      ];
}
