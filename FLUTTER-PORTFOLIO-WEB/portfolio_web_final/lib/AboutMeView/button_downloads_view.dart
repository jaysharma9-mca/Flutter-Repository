import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ButtonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, size) {
      if (size.isMobile) return ButtonMobileView();
      return ButtonDesktopView();
    });
  }
}

class ButtonMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: width * 0.45,
          height: height * 0.07,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(32.0),
            ),
            color: Color(0xFFc8e3f4),
            onPressed: () {},
            child: Row(
              children: [
                Image.asset(
                  "assets/images/download.png",
                  width: width * 0.03,
                  height: height * 0.04,
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Expanded(
                  child: SizedBox(
                    height: height * 0.05,
                    child: FittedBox(
                      child: AutoSizeText(
                        "Download COVER LETTER",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: height * 0.03,
        ),
        Container(
          width: width * 0.45,
          height: height * 0.07,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(32.0),
            ),
            color: Color(0xFFc8e3f4),
            onPressed: () {},
            child: Row(
              children: [
                Image.asset(
                  "assets/images/save.png",
                  width: width * 0.03,
                  height: height * 0.08,
                ),
                SizedBox(
                  width: width * 0.01,
                ),
                Expanded(
                  child: SizedBox(
                    height: height * 0.03,
                    child: FittedBox(
                      child: AutoSizeText(
                        "Download CV",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ButtonDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: width * 0.20,
          height: height * 0.07,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(32.0),
            ),
            color: Color(0xFFc8e3f4),
            onPressed: () {},
            child: Row(
              children: [
                Image.asset(
                  "assets/images/download.png",
                  width: width * 0.03,
                  height: height * 0.04,
                ),
                Expanded(
                  child: FittedBox(
                    child: AutoSizeText(
                      "Download COVER LETTER",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: width * 0.03,
        ),
        Container(
          width: width * 0.20,
          height: height * 0.07,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(32.0),
            ),
            color: Color(0xFFc8e3f4),
            onPressed: () {},
            child: Row(
              children: [
                Image.asset(
                  "assets/images/save.png",
                  width: width * 0.03,
                  height: height * 0.04,
                ),
                Expanded(
                  child: SizedBox(
                    height: height * 0.04,
                    child: FittedBox(
                      child: AutoSizeText(
                        "Download CV",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
