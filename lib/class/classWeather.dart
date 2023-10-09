import 'package:flutter/material.dart';

class Weather {
  String? cityName;
  String? details;
  int? temp;
  String? icon;

  Weather({this.cityName, this.details, this.temp, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        cityName: json["weather"]["name"],
        details: json["weather"]["details"],
        icon: json["weather"]["icon"],
        temp: int.parse(json["weather"]["main"]["temp"]));
  }
}
