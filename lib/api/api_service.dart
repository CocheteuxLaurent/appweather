import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:appweather/class/classWeather.dart';
import 'package:http/http.dart' as http;

class WeatherFunction {
  static Future<Weather> getWeather(String? location) async {
    final id = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$location&units=metrics&APPID=9a69b47d1d0c07520ff44cf15eaaaa78');
    final response = await http.get(id);

    if (response.statusCode == 200) {
      Map weather = json.decode(response.body);
      print(weather);
      print(response);
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception("Une erreur est survenue !!!!");
    }
  }
}
