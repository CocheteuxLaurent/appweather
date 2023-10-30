import 'package:flutter/material.dart';
import 'package:appweather/screens/nextday.dart';
import 'package:appweather/screens/registeredlocations.dart';
import 'package:appweather/screens/search.dart';
import 'package:appweather/screens/homepage.dart';

class NextDayPage extends StatefulWidget {
  const NextDayPage({
    super.key,
  });

  @override
  State<NextDayPage> createState() => _NextDayPageState();
}

class _NextDayPageState extends State<NextDayPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(213, 222, 255, 1),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        elevation: 0,
        title: const Text(
          'Prochains jours',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(213, 222, 255, 1),
      ),
      endDrawer: Drawer(
        width: 200,
        backgroundColor: const Color.fromRGBO(213, 222, 255, 1),
        surfaceTintColor: Colors.black,
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Icon(Icons.nightlight_outlined),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Icon(Icons.close),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Accueil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Prochain jours'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NextDayPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Lieux enregistrés'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisteredLocationsPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Rechercher'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
