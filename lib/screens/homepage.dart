import 'package:appweather/class/classWeather.dart';
import 'package:flutter/material.dart';
import 'package:appweather/components/bottom_bar.dart';
import 'package:appweather/components/weather_card.dart';

import '../api/api_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //instance de la class
  var weatherFunction = WeatherFunction.getWeather("Valenciennes");
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: WeatherCard(),
          ),
          Expanded(
            child: BottomBar(),
          ),
        ],
      ),
    );
  }
}
