import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoplist/navigation.dart';
import 'package:shoplist/theme.dart';

void main() {
  runApp(ShopList());
}

class ShopList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: darkGrey,
        accentColor: Color.fromRGBO(255, 159, 28, 1),
        fontFamily: GoogleFonts.comfortaa().fontFamily,
      ),
      home: Navigation(),
    );
  }
}