import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

final lightGrey = Color.fromRGBO(73, 72, 80, 1);
final darkGrey = Color.fromRGBO(39, 39, 39, 1);

List < BoxShadow > elevation(double elevation) {
  return [
    BoxShadow(
      color: Colors.grey[900],
      offset: Offset(0, elevation),
      blurRadius: 4.0,
    ),
  ];
}