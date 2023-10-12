import 'package:flutter/material.dart';

class WeatherCard extends StatefulWidget {
  WeatherCard();

  @override
  _WeatherCardState createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 120,
        width: 120,
        child: Card(),
      ),
    );
  }
}
