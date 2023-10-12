import 'package:appweather/class/classWeather.dart';
import 'package:flutter/material.dart';
import 'package:appweather/components/bottom_bar.dart';

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
              return /*
              Container(
                child: Text(
                  main.toString(),
                ),
              );
              */
                  Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/$icon.png",
                      scale: 4,
                      height: 90,
                      width: 90,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          main.toString(),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            description.toString(),
                            style: const TextStyle(fontSize: 12),
                          ),
                          Text(
                            temp.toString(),
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          humidity.toString(),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
          Expanded(child: BottomBar()),
        ],
      ),
    );
  }
}
