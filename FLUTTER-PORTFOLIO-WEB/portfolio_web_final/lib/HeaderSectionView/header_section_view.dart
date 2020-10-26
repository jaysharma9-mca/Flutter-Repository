import 'package:flutter/material.dart';
import 'package:portfolio_web_final/NavigationDrawerView/navigation_drawer_item_view.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'logo_view.dart';
import 'menu.dart';
import 'opaque_glass_container_view.dart';

class HeaderSectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, size) {
        if (size.isMobile) {
          return HeaderMobileView();
        }
        return HeaderDesktopView();
      },
    );
  }
}

class HeaderMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/background.png"),
        ),
      ),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          Container(
            child: NavigationBarView(),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          OpaqueGlassContainerView(),
        ],
      ),
    );
  }
}

class HeaderDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/background.png"),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LogoView(),
          OpaqueGlassContainerView(),
          SizedBox(
            height: height * 0.06,
          ),
          Center(
            child: Menu(),
          ),
        ],
      ),
    );
  }
}
