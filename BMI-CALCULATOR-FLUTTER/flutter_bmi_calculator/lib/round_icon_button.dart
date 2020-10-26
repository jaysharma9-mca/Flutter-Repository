import 'package:flutter/material.dart';

import 'constants.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  RoundIconButton({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 52.0, height: 52.0),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
      child: Icon(icon),
    );
  }
}
