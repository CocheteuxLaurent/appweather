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
    var _SelectedIndex;

    void _handleIndexChanged(int i) {
      setState(() {
        _SelectedIndex = _SelectedIndex.values[i];
      });
    }

    return Scaffold(
      //extendBody: true,
      body: Container(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: DotNavigationBar(
          margin: EdgeInsets.only(right: 6, left: 6),
          currentIndex: _SelectedIndex.values.indexOf(_SelectedIndex),
          unselectedItemColor: Colors.grey,
          splashBorderRadius: 50,
          onTap: _handleIndexChanged,
          items: [
            DotNavigationBarItem(
              icon: Icon(Icons.home),
              selectedColor: Color.fromRGBO(3, 163, 232, 1),
            ),
            DotNavigationBarItem(
              icon: Icon(Icons.search),
              selectedColor: Color.fromRGBO(3, 163, 232, 1),
            ),
          ],
        ),
      ),
    );
  }
}

enum _SelectedIndex { home, search }
