import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

class BottomBar extends StatefulWidget {
  BottomBar();

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    var _selectedIndex = _SelectedIndex.home;

    void _handleIndexChanged(int i) {
      setState(() {
        _selectedIndex = _SelectedIndex.values[i];
      });
    }

    return Scaffold(
      //extendBody: true,
      body: Container(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: DotNavigationBar(
          margin: const EdgeInsets.only(right: 6, left: 6),
          currentIndex: _SelectedIndex.values.indexOf(_selectedIndex),
          unselectedItemColor: Colors.grey,
          splashBorderRadius: 50,
          onTap: _handleIndexChanged,
          items: [
            DotNavigationBarItem(
              icon: const Icon(Icons.home),
              selectedColor: const Color.fromRGBO(3, 163, 232, 1),
            ),
            DotNavigationBarItem(
              icon: const Icon(Icons.search),
              selectedColor: const Color.fromRGBO(3, 163, 232, 1),
            ),
          ],
        ),
      ),
    );
  }
}

enum _SelectedIndex { home, search }
