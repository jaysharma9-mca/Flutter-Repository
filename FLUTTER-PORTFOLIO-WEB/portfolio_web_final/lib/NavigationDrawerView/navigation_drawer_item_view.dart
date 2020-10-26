import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ResponsiveBuilder(builder: (context, size) {
      if (size.isMobile) {
        return NavigationMobileView(height: height);
      }
      return SizedBox();
    });
  }
}

class NavigationMobileView extends StatelessWidget {
  const NavigationMobileView({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.07,
      width: double.infinity,
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.08),
        child: Row(
          children: [
            FlutterLogo(
              size: height * 0.04,
            ),
            Spacer(),
            IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                  //Scaffold.of(context).openEndDrawer()Drawer(); // open from right side
                })
          ],
        ),
      ),
    );
  }
}

class NavigationItem {
  final String text;
  NavigationItem(this.text);
}

final kNavigationItems = [
  NavigationItem('Projects'),
  NavigationItem('Skills'),
  NavigationItem('About Me'),
  NavigationItem('Blog'),
];

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    Key key,
    @required this.onPressed,
    @required this.text,
  }) : super(key: key);

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 35.0),
      child: InkWell(
        mouseCursor: MaterialStateMouseCursor.clickable,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onPressed, // needed  //extracted the () => using ctrl+alt+v
        child: Ink(
          child: Text(
            text, //extracted the text using ctrl+alt+v
            style: GoogleFonts.montserrat(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
