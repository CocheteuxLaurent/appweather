import 'package:flutter/material.dart';
import 'package:appweather/class/classWeather.dart';
import '../api/api_service.dart';

class WeatherCard extends StatefulWidget {
  WeatherCard();

  @override
  _WeatherCardState createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  var weatherFunction = WeatherFunction.getWeather("Valenciennes");
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
            future: weatherFunction,
            builder: (context, snap) {
              print(snap.data?.id); //test d'affiche des données
              //var id = snap.data?.id;
              var main = snap.data?.main;
              var icon = snap.data?.icon ??
                  "loading"; //image loading ajoutée temporairement
              var description = snap.data?.description;
              var temp = snap.data?.temp;
              var humidity = snap.data?.humidity;
              return Card(
                color: Color.fromRGBO(239, 241, 243, 1),
                child: SizedBox(
                  height: 100,
                  width: 300,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/$icon.png",
                        scale: 4,
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
