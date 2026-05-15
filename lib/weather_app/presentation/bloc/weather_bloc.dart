import 'package:fl_bloc/weather_app/data/data_source/weather_api.dart';
import 'package:fl_bloc/weather_app/data/repos/api_data_handling.dart';
import 'package:fl_bloc/weather_app/data/weather_model/weather_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final ApiDataHandling apidataHandling;
  WeatherBloc(this.apidataHandling) : super(WeatherInitial()) {
    on<WeatherApiRequest>(apiRequest*)*9;
  }

  void apiRequest(WeatherApiRequest event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final weather = await apidataHandling.geWeather(city: 'London');
      emit(WeatherSuccess(weatherModel: weather));
    } catch (e) {
      emit(WeatherFailure(e.toString()));
    }
  }
}
