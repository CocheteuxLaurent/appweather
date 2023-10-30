import 'package:flutter/material.dart';
import 'package:appweather/screens/homepage.dart';
import 'package:appweather/screens/nextday.dart';
import 'package:appweather/screens/registeredlocations.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
        elevation: 0,
        backgroundColor: const Color.fromRGBO(213, 222, 255, 1),
        title: _buildSearchBar(),
        automaticallyImplyLeading: false,
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

Widget _buildSearchBar() {
  TextEditingController _searchController = TextEditingController();

  return Container(
    width: 400,
    height: 40,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
    ),
    child: TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Rechercher',
        border: InputBorder.none,
        prefixIcon: Icon(Icons.search, color: Colors.grey),
      ),
    ),
  );
}
