import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AboutMeDescOneWidget extends StatelessWidget {
  const AboutMeDescOneWidget({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore mag aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      textAlign: TextAlign.justify,
      textDirection: TextDirection.ltr,
      style: TextStyle(
        fontSize: width * 0.014,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}

class AboutMeDescTwoWidget extends StatelessWidget {
  const AboutMeDescTwoWidget({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore mag aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      textAlign: TextAlign.justify,
      textDirection: TextDirection.ltr,
      style: TextStyle(
        fontSize: width * 0.014,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}
