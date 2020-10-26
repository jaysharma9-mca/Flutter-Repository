import 'package:flutter/material.dart';
import 'package:portfolio_web_final/AboutMeView/experience_card_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'about_me_desc_view.dart';
import 'about_me_text_view.dart';
import 'button_downloads_view.dart';

class AboutMeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, size) {
        if (size.isMobile) return AboutMeMobileView();
        return AboutMeDesktopView();
      },
    );
  }
}

class AboutMeMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      constraints: BoxConstraints(
        maxWidth: width * 0.87,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AboutMeTextWidget(width: width),
          SizedBox(
            height: height * 0.05,
          ),
          AboutMeDescOneWidget(width: width),
          SizedBox(
            height: height * 0.05,
          ),
          ExperienceCardView(),
          SizedBox(
            height: height * 0.05,
          ),
          AboutMeDescTwoWidget(width: width),
          SizedBox(
            height: height * 0.05,
          ),
          ButtonView(),
          SizedBox(
            height: height * 0.02,
          ),
        ],
      ),
    );
  }
}

class AboutMeDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      constraints: BoxConstraints(
        maxWidth: width * 0.87,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AboutMeTextWidget(width: width),
          SizedBox(
            height: height * 0.15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: AboutMeDescOneWidget(width: width),
              ),
              SizedBox(
                width: width * 0.06,
              ),
              Expanded(
                child: ExperienceCardView(),
              ),
              SizedBox(
                width: width * 0.06,
              ),
              Expanded(
                flex: 2,
                child: AboutMeDescTwoWidget(width: width),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.15,
          ),
          ButtonView(),
        ],
      ),
    );
  }
}
