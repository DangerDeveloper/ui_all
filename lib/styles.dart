import 'package:flutter/material.dart';

const kBackgroundBg = Color(0xffCDDEEC);

List<BoxShadow> softUiShadow = [
  BoxShadow(
    color: Colors.white,
    offset: Offset(-5, -5),
    spreadRadius: 1.0,
    blurRadius: 15.0,
  ),
  BoxShadow(
    color: Color(0Xff748CAC).withOpacity(0.6),
    offset: Offset(5, 5),
    spreadRadius: 1.0,
    blurRadius: 15.0,
  ),
];

const activeGradient = LinearGradient(
  colors: <Color>[
    Color(0xff4042b1),
    Color(0xff63399d),
    Color(0xff963486),
  ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);


List<IconData> iconForBtns=[
  Icons.directions_walk,
  Icons.donut_small,
  Icons.track_changes,
  Icons.tune,
];
