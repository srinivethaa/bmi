import 'package:flutter/material.dart';

const kBottomContainerHeight = 80.0;
const kInactiveCardColour = Color(0xFFEF9A9A);
const kActiveCardColour = Color(0xFFFF8A80);

const kLabelTextStyle =  TextStyle(
    fontSize: 18.0, color: Colors.white,
);

const kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

const kLargeButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

const kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);

const kResultTextStyle = TextStyle(
  color: Colors.tealAccent,
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

const kBMITextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
);

const kBodyTextStyle = TextStyle(
  fontSize: 22.0,
);

final ThemeData themeData = ThemeData.dark().copyWith(
  primaryColor: Colors.red[100],
  scaffoldBackgroundColor: Colors.white70,
);
