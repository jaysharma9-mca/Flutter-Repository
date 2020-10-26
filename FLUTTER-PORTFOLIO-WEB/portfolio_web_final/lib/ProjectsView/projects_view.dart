import 'package:flutter/material.dart';
import 'package:portfolio_web_final/ProjectsView/project_work.dart';
import 'package:portfolio_web_final/constants.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'projects_container_view.dart';

class ProjectView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, size) {
        if (size.isMobile) return ProjectMobileView();
        return ProjectDesktopView();
      },
    );
  }
}

class ProjectMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Color(0xFFF7E8FF).withOpacity(0.3),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/projects.png"),
        ),
      ),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          Text(
            "My Projects",
            style: TextStyle(
              fontSize: width * 0.07,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 25),
            width: width * 0.40,
            height: height * 0.01,
            color: Color(0xFFFFB100),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          SizedBox(
            child: Wrap(
              spacing: kDefaultPadding,
              runSpacing: kDefaultPadding * 2,
              children: List.generate(
                projectWork.length,
                (index) => ProjectsContainer(
                  index: index,
                  press: () {},
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
        ],
      ),
    );
  }
}

class ProjectDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    //final screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF7E8FF).withOpacity(0.3),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/projects.png"),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.07, vertical: height * 0.15),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: kDefaultPadding),
                  padding: EdgeInsets.only(bottom: 25),
                  width: 8,
                  height: height * 0.10,
                  color: Colors.black,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xFFFFB100),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "My Projects",
                      style: TextStyle(
                        fontSize: width * 0.032,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: height * 0.15,
            ),
            SizedBox(
              child: Wrap(
                spacing: kDefaultPadding,
                runSpacing: kDefaultPadding * 2,
                children: List.generate(
                  projectWork.length,
                  (index) => ProjectsContainer(
                    index: index,
                    press: () {},
                  ),
                ),
              ),
            ),
            //ProjectsContainer(screenSize: screenSize),
          ],
        ),
      ),
    );
  }
}
