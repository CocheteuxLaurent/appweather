import 'package:appweather/class/classWeather.dart';
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
  //instance de la class
  var _currentCity;
  Position? _currentPosition;

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
      },
    );
    setState(() {
      _currentCity;
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
      backgroundColor: const Color.fromRGBO(213, 222, 255, 1),
      appBar: AppBar(
        title: Text(_currentCity ?? "wait"),
        centerTitle: true,
      ),
      endDrawer: Drawer(
        backgroundColor: const Color.fromRGBO(213, 222, 255, 1),
        child: ListView(
          children: [
            /*DrawerHeader(
              child: Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.close),
                    label: Text('Fermer'),
                  ),
                ],
              ),
            ),
            */
            ListTile(
              title: const Text('Accueil'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Prochain jours'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Lieux enregistrés'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Rechercher'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: WeatherFunction.getWeather("", ''),
        builder: (BuildContext context, AsyncSnapshot<Weather> snapshot) {
          //  widget.lat.toString(), widget.long.toString()),
          // var cityname = snap.data?.name;
          return Column(
            children: [],
          );
        },
      ),
      /*
      Column(
        children: [
          
          Expanded(
            child: WeatherCard(
                lat: _currentPosition!.longitude.toString(),
                long: _currentPosition!.latitude.toString()),
          ),
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
          Expanded(
            child: BottomBar(),
          ),
         
        ],
         */
    );
  }
}
