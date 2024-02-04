import 'package:appweather/class/classWeather.dart';
import 'package:appweather/components/drawer.dart';
import 'package:appweather/components/weather_card.dart';
import 'package:appweather/components/weather_card_details.dart';
import 'package:appweather/screens/nextday.dart';
import 'package:appweather/screens/registeredlocations.dart';
import 'package:appweather/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../api/api_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  //instance de la class
  var _currentCity;
  var _currentCountry;
  Position? _currentPosition;

  bool isSelected = true;

  @override
  void initState() {
    super.initState();
    _getCurrentPosition();
  }

  Future getCity() async {
    await WeatherFunction.getWeather(
      _currentPosition!.latitude.toString(),
      _currentPosition!.latitude.toString(),
    ).then(
      (value) => {
        _currentCity = value.countryName.toString(),
        _currentCountry = value.country.toString(),
      },
    );
    setState(() {
      _currentCity;
      _currentCountry;
    });
    // print('helllo');
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(
        () => _currentPosition = position,
      );
      debugPrint(_currentPosition.toString());
      getCity();
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      drawer: MyDrawer(),
      backgroundColor: const Color.fromRGBO(213, 222, 255, 1),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
              left: MediaQuery.of(context).size.width * 0.38,
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      _currentCity ?? "loading",
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      ',',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      _currentCountry ?? "loading",
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                    child: const Icon(
                      Icons.menu,
                      size: 26,
                    ),
                  ),
                  onTap: () => _scaffoldState.currentState!.openDrawer(),
                ),
              ],
            ),
          ),
          WeatherCard(
            lat: _currentPosition?.longitude.toString() ?? "loading",
            long: _currentPosition?.latitude.toString() ?? "loading",
          ),
          /*
      FutureBuilder(
        future: WeatherFunction.getWeather("", ''),
        builder: (BuildContext context, AsyncSnapshot<Weather> snapshot) {
          //  widget.lat.toString(), widget.long.toString()),
          // var cityname = snap.data?.name;
          return Column(
            children: [],
          );
        },
      ),
      */
          /*
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                _currentPosition!.longitude.toString(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                _currentPosition!.latitude.toString(),
              ),
            ],
          ),
          */
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: WeatherCardDetails(
              lat: _currentPosition!.longitude.toString(),
              long: _currentPosition!.latitude.toString(),
            ),
          ),
        ],
      ),
    );
  }
}
