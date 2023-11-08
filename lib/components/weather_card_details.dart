import 'package:flutter/material.dart';
import 'package:appweather/class/classWeather.dart';
import '../api/api_service.dart';

class WeatherCardDetails extends StatefulWidget {
  WeatherCardDetails({
    required this.lat,
    required this.long,
  });
  final String lat;
  final String long;

  @override
  _WeatherCardDetailsState createState() => _WeatherCardDetailsState();
}

class _WeatherCardDetailsState extends State<WeatherCardDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: WeatherFunction.getWeather(
            widget.lat.toString(), widget.long.toString()),
        builder: (context, snap) {
          var icon = snap.data?.icon ?? "loading";
          var temp = snap.data?.temp;
          return Column(
            children: [
              /*
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Text('Aujourd\'hui'),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Text('Prochains jours'),
                  ),
                  Container(
                    //margin: const EdgeInsets.only(right: 10),
                    child: Icon(Icons.keyboard_arrow_right),
                  ),
                ],
              )
              */
              Row(
                children: [
                  const Text(
                    'Aujourd\'hui',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Prochains jours',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.keyboard_arrow_right),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: const Color.fromRGBO(255, 255, 255, 0.5),
                  child: SizedBox(
                    width: double.maxFinite,
                    height: 150,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Lever du soleil'),
                            const Text('Coucher du soleil'),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
