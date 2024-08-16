import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
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
  Future<void> fetchWeather() async {
    emit(state.copyWith(isLoading: true));
    try {
      final items = await _weatherAppRepository.getDailyData();
      final hourlyItems = await _weatherAppRepository.getHourlyData();
      emit(state.copyWith(
          items: items, hourlyItems: hourlyItems, isLoading: false));
    } on Exception catch (ex, stacktrace) {
      logger.e('Failed to load: ex $ex, stacktrace: $stacktrace');
      emit(state.copyWith(isError: true, isLoading: false));
    }
  }
}
