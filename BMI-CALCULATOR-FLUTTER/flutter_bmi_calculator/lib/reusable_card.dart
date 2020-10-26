import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onPress;
  ReusableContainer({this.colour, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
        child: cardChild,
      ),
    );
  }
}
