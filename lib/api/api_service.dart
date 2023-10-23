import 'dart:convert';
import 'package:appweather/class/classWeather.dart';
import 'package:http/http.dart' as http;

class WeatherFunction {
  static Future<Weather> getWeather(String? lat, String? lon) async {
    final loca = Uri.parse(
        ' https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=9a69b47d1d0c07520ff44cf15eaaaa78');
    final response = await http.get(loca);

    /*'https://api.openweathermap.org/data/2.5/weather?q=$location&units=metrics&APPID=9a69b47d1d0c07520ff44cf15eaaaa78'*/

    if (response.statusCode == 200) {
      // var body = jsonDecode(response.body);
      print(response.body);
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Une erreur est survenue !!!!");
    }
  }
}
