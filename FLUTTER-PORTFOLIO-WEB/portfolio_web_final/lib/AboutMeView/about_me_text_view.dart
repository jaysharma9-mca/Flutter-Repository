import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web_final/constants.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutMeTextWidget extends StatelessWidget {
  const AboutMeTextWidget({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, size) {
        if (size.isMobile) return AboutTextMobileView();
        return AboutTextDesktopView();
      },
    );
  }
}

class AboutTextMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return AutoSizeText(
      "About",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: width * 0.07,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}

class AboutTextDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: kDefaultPadding),
          padding: EdgeInsets.only(bottom: 25),
          width: 8,
          height: height * 0.10,
          color: Colors.black,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xFFFF0000),
            ),
          ),
        ),
        AutoSizeText(
          "About",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: width * 0.03,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
