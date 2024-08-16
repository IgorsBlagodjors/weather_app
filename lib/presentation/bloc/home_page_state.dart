import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/daily_data_class.dart';
import 'package:weather_app/domain/hourly_data_class.dart';

class HomePageState extends Equatable {
  final List<DailyData> items;
  final List<HourlyData> hourlyItems;
  final bool isLoading;
  final bool isError;

  const HomePageState({
    required this.items,
    required this.isLoading,
    required this.isError,
    required this.hourlyItems,
  });

  HomePageState copyWith({
    List<DailyData>? items,
    List<HourlyData>? hourlyItems,
    bool? isLoading,
    bool? isError,
  }) =>
      HomePageState(
        items: items ?? this.items,
        hourlyItems: hourlyItems ?? this.hourlyItems,
        isLoading: isLoading ?? this.isLoading,
        isError: isError ?? this.isError,
      );

  @override
  List<Object?> get props => [
        items,
        hourlyItems,
        isLoading,
        isError,
      ];
}
