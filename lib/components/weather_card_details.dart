import 'package:flutter/material.dart';
import 'package:appweather/class/classWeather.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    double CurrentValue = 0;

    return FutureBuilder(
      future: WeatherFunction.getWeather(
          widget.lat.toString(), widget.long.toString()),
      builder: (context, snap) {
        var icon = snap.data?.icon ?? "loading";
        var temp = snap.data?.temp;
        return Column(
          children: [
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
            const SizedBox(
              height: 50,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              color: const Color.fromRGBO(234, 239, 255, 1),
              child: Container(
                width: 900,
                height: 180,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 15,
                              top: 10,
                            ),
                            child: Text('Lever du soleil'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: 15,
                              top: 10,
                            ),
                            child: Text('Coucher du soleil'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: SvgPicture.asset('./assets/moon_2.svg'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Image.asset(
                              './assets/sun.png',
                            ),
                          ),
                          const Text('8h05'),
                          const SizedBox(
                            width: 155,
                          ),
                          Image.asset(
                            './assets/moon.png',
                          ),
                          const Text('19h30'),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                'Qualité de l’air',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              '${CurrentValue.toInt()}',
                            ),
                          ),
                          Expanded(
                            child: Slider(
                              value: CurrentValue,
                              max: 100,
                              divisions: 1,
                              thumbColor: Colors.black,
                              onChanged: (value) {
                                setState(() {
                                  CurrentValue = value;
                                });
                              },
                            ),
                          )
                          /*
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                thumbColor: Colors.white,
                                overlayColor: const LinearGradient(
                                  colors: [
                                    Colors.green,
                                    Colors.yellow,
                                    Colors.orange,
                                    Colors.red,
                                  ],
                                  stops: [0, 0.33, 0.66, 1],
                                )
                                    .colors
                                    .first, // Utilisez la première couleur du dégradé
                                inactiveTrackColor: Colors.grey,
                              ),
                              child: Slider(
                                value: sliderValue,
                                onChanged: (value) {
                                  setState(() {
                                    sliderValue = value;
                                  });
                                },
                              ),
                            ),
                            */

                          /*
                          Expanded(
                            child: SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                thumbColor: Colors.white,
                                activeTrackColor: LinearGradient(
                                  colors: [
                                    Colors.green,
                                    Colors.yellow,
                                    Colors.orange,
                                    Colors.red,
                                  ],
                                  stops: [0, 0.33, 0.66, 1],
                                ).createShader(
                                  Rect.fromPoints(
                                    Offset(0, 0),
                                    Offset(200, 0),
                                  ),
                                ),
                                inactiveTrackColor: Colors.grey,
                              ),
                              child: Slider(
                                value: sliderValue,
                                onChanged: (value) {
                                  setState(() {
                                    sliderValue = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          */
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
