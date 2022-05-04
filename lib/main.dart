import 'package:bmi_demo/constants.dart';
import 'package:flutter/material.dart';
import 'pages/input_page.dart';
void main() {
  runApp(BMICalculator());
}
class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: InputPage(),
    );
  }
}

