import 'package:flutter/material.dart';

import 'constants.dart';



class IconContent extends StatelessWidget {
  final IconData icon; //since the data type of icon is IconData
  final String label; //since the data type of text is String

  IconContent({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kLabelStyle,
        ),
      ],
    );
  }
}
