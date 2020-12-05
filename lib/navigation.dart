import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shoplist/models/navigationItem.dart';
import 'package:shoplist/screens/home.dart';
import 'package:shoplist/screens/settings.dart';
import 'package:shoplist/theme.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

PageController _pageController = PageController(initialPage: 0);
int _selected = 0;
List < NavigationItem > _children = [
  NavigationItem(
    title: "Home",
    icon: Icon(Icons.home),
    screen: Home(),
  ),
  NavigationItem(
    title: "Location",
    icon: Icon(Icons.place),
    screen: Home(),
  ),
  NavigationItem(
    title: "Sharing",
    icon: Icon(Icons.share),
    screen: Home(),
  ),
  NavigationItem(
    title: "Settings",
    icon: Icon(Icons.settings),
    screen: Settings(),
  ),
];

class _NavigationState extends State < Navigation > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: _children.map((widget) => widget.screen).toList(),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: lightGrey,
          borderRadius: BorderRadius.circular(32),
          boxShadow: elevation(4.0),
        ),
        child: SalomonBottomBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          currentIndex: _selected,
          onTap: (selected) {
            setState(() => _selected = selected);
            _pageController.animateToPage(
              selected,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          items: _children.map((item) => SalomonBottomBarItem(
            title: Text(
              item.title,
              style: GoogleFonts.comfortaa(),
            ),
            icon: item.icon,
          )).toList(),
        ),
      ),
    );
  }
}