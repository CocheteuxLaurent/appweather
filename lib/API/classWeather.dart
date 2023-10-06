import 'dart:convert';
import 'package:http/http.dart' as http;

class Weather {
  String? date;
  String? weatherCity;
  String? details;

  Weather({
    this.date,
    this.weatherCity,
    this.details,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      date: json["date"],
      weatherCity: json["weather"],
      details: json["details"],
    );
  }
}

class weatherFunction {
  static Future<Weather> getWeather(id) async {
    final id = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?id=524901&appid=dbf7ccf2a3900911302d4271fbb90a74');
    final response = await http.get(id);

    if (response.statusCode == 200) {
      Map weather = json.decode(response.body);
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception("Une erreur est survenue !!!!");
    }
  }
}
