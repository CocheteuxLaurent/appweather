import 'package:flutter/material.dart';
import 'package:appweather/class/classWeather.dart';
import '../api/api_service.dart';

class WeatherCard extends StatefulWidget {
  WeatherCard({
    required this.lat,
    required this.long,
  });
  final String lat;
  final String long;

  @override
  _WeatherCardState createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  @override
  void initState() {
    super.initState();
  }

  final date = DateTime.now();

  final formattedDate = '${_getDate(DateTime.now())}';

  final formattedTime = '${_getFormattedTime(DateTime.now())}';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: WeatherFunction.getWeather(
          widget.lat.toString(), widget.long.toString()),
      builder: (context, snap) {
        print(snap.data?.id); //test d'affiche des données
        //var id = snap.data?.id;
        var main = snap.data?.main;
        var icon =
            snap.data?.icon ?? "loading"; //image loading ajoutée temporairement
        var description = snap.data?.description;
        var temp = snap.data?.temp;
        var humidity = snap.data?.humidity;
        //var latitude = snap.data?.latitude;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "asset/$icon.png",
                  height: 50,
                  width: 50,
                  scale: 4,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    temp.toString() + '°',
                    style: const TextStyle(
                      fontSize: 25,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  formattedDate + '.',
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Text(
                  '  ',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  formattedTime,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )
            /*
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: const Color.fromRGBO(213, 222, 255, 1),
              child: SizedBox(
                width: 300,
                height: 80,
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
            ),
            */
          ],
        );
      },
    );
  }
}

String _getDate(DateTime dateTime) {
  final day = dateTime.day;
  final month = dateTime.month;
  const monthNames = [
    'Janvier',
    'Février',
    'Mars',
    'Avril',
    'Mai',
    'Juin',
    'Juillet',
    'Août',
    'Septembre',
    'Octobre',
    'Novembre',
    'Décembre'
  ];

  const dayNames = [
    'Lundi',
    'Mardi',
    'Mercredi',
    'Jeudi',
    'Vendredi',
    'Samedi',
    'Dimanche',
  ];

  final dayOfWeek = dayNames[dateTime.weekday - 1].substring(0, 3);

  return '$dayOfWeek $day ${monthNames[month - 1].substring(0, 3)}';
}

String _getFormattedTime(DateTime dateTime) {
  final hour = dateTime.hour.toString().padLeft(2, '0');
  final minute = dateTime.minute.toString().padLeft(2, '0');
  return '$hour' + 'h' + '$minute';
}
