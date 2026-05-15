import 'dart:convert';

import 'package:fl_bloc/weather_app/data/data_source/weather_api.dart';
import 'package:fl_bloc/weather_app/data/weather_model/weather_model.dart';

class ApiDataHandling {
  final WeatherApi _weatherApi;
  ApiDataHandling(this._weatherApi);
  // final response = _weatherApi.
  Future<WeatherModel> geWeather({required String city}) async {
    try {
      final String response = await _weatherApi.getWeather(city: city);
      final Map<String, dynamic> decoded = jsonDecode(response);
      if (decoded['cod'] != '200') {
        throw 'Unknown error caught';
      }
      return WeatherModel.fromJson(response);
    } catch (e) {
      throw e.toString();
    }
  }
}
