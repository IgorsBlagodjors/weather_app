import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:weather_app/domain/weather_app_repository.dart';
import 'package:weather_app/presentation/bloc/weather_home_page_state.dart';

class WeatherHomePageCubit extends Cubit<WeatherHomePageState> {
  final WeatherAppRepository _weatherAppRepository;
  final logger = Logger();
  WeatherHomePageCubit(this._weatherAppRepository)
      : super(
          const WeatherHomePageState(
            items: [],
            isLoading: false,
            isError: false,
          ),
        );
  Future<void> fetchWeather() async {
    emit(state.copyWith(isLoading: true));
    try {
      final items = await _weatherAppRepository.getDailyData();

      emit(state.copyWith(items: items, isLoading: false));
    } on Exception catch (ex, stacktrace) {
      logger.e('Failed to load: ex $ex, stacktrace: $stacktrace');
      emit(state.copyWith(isError: true, isLoading: false));
    }
  }
}
