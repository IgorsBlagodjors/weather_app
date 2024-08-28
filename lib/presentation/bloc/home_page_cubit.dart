import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'package:weather_app/domain/daily_data_class.dart';
import 'package:weather_app/domain/hourly_data_class.dart';
import 'package:weather_app/domain/weather_app_repository.dart';
import 'package:weather_app/presentation/bloc/home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final WeatherAppRepository _weatherAppRepository;
  final logger = Logger();
  HomePageCubit(this._weatherAppRepository)
      : super(
          const HomePageState(
            items: [],
            hourlyItems: [],
            isLoading: false,
            isError: false,
          ),
        );
  Future<void> fetchWeather(Position? position) async {
    emit(state.copyWith(isLoading: true));
    try {
      final items = await _weatherAppRepository.getDailyData(position);
      final hourlyItems = await _weatherAppRepository.getHourlyData(position);
      emit(state.copyWith(
          items: items, hourlyItems: hourlyItems, isLoading: false));
    } on Exception catch (ex, stacktrace) {
      logger.e('Failed to load: ex $ex, stacktrace: $stacktrace');
      emit(state.copyWith(isError: true, isLoading: false));
    }
  }

  Future<Position> getCurrentLocation() async {
    Position locationData;
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission == await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions permamently denied');
    }
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    locationData =
        await Geolocator.getCurrentPosition(locationSettings: locationSettings);
    return locationData;
  }

  String getLiveTemp(List<HourlyData> hourlyItems) {
    DateTime now = DateTime.now();
    for (var data in hourlyItems) {
      if (data.datetime.hour == now.hour) {
        return data.temp;
      }
    }
    return 'Unknown';
  }

  String getLiveWeatherCondition(List<HourlyData> hourlyItems) {
    DateTime now = DateTime.now();
    for (var data in hourlyItems) {
      if (data.datetime.hour == now.hour) {
        return data.conditions;
      }
    }
    return 'Unknown';
  }

  String _getTempForCurrentDay(
      List<DailyData> dailyItems, String Function(DailyData) tempSelector) {
    DateTime now = DateTime.now();
    for (var data in dailyItems) {
      if (data.date.day == now.day) {
        return tempSelector(data);
      }
    }
    return 'Unknown';
  }

  String getLiveMinTemp(List<DailyData> dailyItems) {
    return _getTempForCurrentDay(dailyItems, (data) => data.tempMin);
  }

  String getLiveMaxTemp(List<DailyData> dailyItems) {
    return _getTempForCurrentDay(dailyItems, (data) => data.tempMax);
  }
}
