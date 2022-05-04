import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {

  IconContent({this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final double phoneHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: phoneHeight/20,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
