import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../constants.dart';

class OpaqueGlassContainerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, size) {
      if (size.isMobile) {
        return OpaqueGlassContainerMobileView();
      }
      return OpaqueGlassContainerDesktopView();
    });
  }
}

class OpaqueGlassContainerMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
            constraints:
                BoxConstraints(maxWidth: width * 0.8, maxHeight: height * 0.78),
            width: double.infinity,
            color: Colors.white.withOpacity(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: width * 0.40,
                  height: height * 0.40,
                  child: Image.asset(
                    "assets/images/person.png",
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                FittedBox(
                  child: AutoSizeText(
                    "Hello There!",
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                FittedBox(
                  child: AutoSizeText(
                    "Jay Sharma",
                    style: Theme.of(context).textTheme.headline2.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                FittedBox(
                  child: AutoSizeText(
                    "Android/Flutter Mobile App Developer",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OpaqueGlassContainerDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 2,
            ),
            constraints: BoxConstraints(
              maxWidth: width * 0.87,
              //maxHeight: height * 0.6,
            ),
            width: double.infinity,
            color: Colors.white.withOpacity(0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        "Hello There!",
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(color: Colors.white),
                      ),
                      AutoSizeText(
                        "Jay \nSharma",
                        style: TextStyle(
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.5,
                        ),
                      ),
                      AutoSizeText(
                        "Android/Flutter Mobile App Developer",
                        style: TextStyle(
                          fontSize: width * 0.02,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                //Image.asset("assets/images/person.png"),
                Spacer(),
                Expanded(
                  child: Image.asset("assets/images/person.png"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
