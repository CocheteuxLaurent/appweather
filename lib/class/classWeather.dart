import 'package:flutter/material.dart';
//import 'package:appweather/api/api_service.dart';

class Weather {
  String? date;
  String? weatherCity;
  String? details;
  double? temp;
  Icon? icon;

  Weather({this.date, this.weatherCity, this.details, this.temp, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      date: json["date"],
      weatherCity: json["weather"],
      details: json["details"],
      icon: json["icon"],
    );
  }
}
