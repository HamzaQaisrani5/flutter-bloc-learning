import 'package:fl_bloc/weather_app/api_keys.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future<String> getWeather({required String city}) async {
    try {
      var response = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$city&APPID=${WeatherKey.secretKey}',
        ),
      );
      // response.
      return response.body;
    } catch (e) {
      return e.toString();
    }
  }
}
