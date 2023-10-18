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
    return FutureBuilder(
      future: weatherFunction,
      builder: (context, snap) {
        print(snap.data?.id); //test d'affiche des données
        //var id = snap.data?.id;
        var main = snap.data?.main;
        var icon =
            snap.data?.icon ?? "loading"; //image loading ajoutée temporairement
        var description = snap.data?.description;
        var temp = snap.data?.temp;
        var humidity = snap.data?.humidity;
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: const Color.fromRGBO(239, 241, 243, 1),
          child: SizedBox(
            width: 300,
            height: 50,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "assets/$icon.png",
                      scale: 4,
                      height: 50,
                      width: 50,
                    ),
                    Text(
                      main.toString(),
                      style: const TextStyle(fontSize: 13),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        temp.toString(),
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                )
                /*
                  Row(
                    children: [
                      Image.asset(
                        "assets/$icon.png",
                        scale: 4,
                        height: 50,
                        width: 50,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        main.toString(),
                        style: const TextStyle(fontSize: 13),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 6, left: 6),
                        child: Text(
                          temp.toString(),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                */
                /*  
                  Expanded(
                    child: Image.asset(
                      "assets/$icon.png",
                      scale: 4,
                    ),
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
                  ),
                  */
              ],
            ),
          ),
        );
      },
    );
  }
}
