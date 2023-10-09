import 'package:appweather/class/classWeather.dart';
import 'package:flutter/material.dart';

import '../api/api_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

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
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Text(widget.title),
          FutureBuilder(
            future: weatherFunction,
            builder: (context, snap) {
              print(snap.data?.id); //test d'affiche des données
              var id = snap.data?.id;
              var description = snap.data?.description;
              return Container(
                child: Text(
                  description.toString(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
