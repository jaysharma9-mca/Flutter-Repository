import 'package:flutter/material.dart';
import 'package:portfolio_web_final/AboutMeView/about_me_view.dart';
import 'package:portfolio_web_final/HeaderSectionView/header_section_view.dart';
import 'package:portfolio_web_final/NavigationDrawerView/navigation_drawer_view.dart';
import 'package:portfolio_web_final/ProjectsView/projects_view.dart';
import 'package:portfolio_web_final/SkillsSectionView/skills_section_view.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    //final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        drawer: DrawerView(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderSectionView(),
              SizedBox(
                height: height * 0.05,
              ),
              AboutMeView(),
              SizedBox(
                height: height * 0.05,
              ),
              ProjectView(),
              SizedBox(
                height: height * 0.05,
              ),
              SkillsSectionView(),
              SizedBox(
                height: height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
