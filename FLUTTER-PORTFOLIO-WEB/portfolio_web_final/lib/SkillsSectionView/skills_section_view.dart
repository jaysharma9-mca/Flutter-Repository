import 'package:flutter/material.dart';
import 'package:portfolio_web_final/SkillsSectionView/skill_set.dart';
import 'package:portfolio_web_final/SkillsSectionView/skill_set_card.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../constants.dart';

class SkillsSectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, size) {
        if (size.isMobile) return SkillsMobileView();
        return SkillsDesktopView();
      },
    );
  }
}

class SkillsMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SkillsDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Duration duration = Duration(milliseconds: 200);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    final screenSize = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(
        maxWidth: width * 0.87,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
            constraints: BoxConstraints(maxWidth: 1110),
            height: 100,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: kDefaultPadding),
                  padding: EdgeInsets.only(bottom: 72),
                  width: 8,
                  height: 100,
                  color: Colors.black,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xFF00B1FF),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Projects",
                      style: TextStyle(
                        fontSize: width * 0.032,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SkillSetCardView(
            screenSize: screenSize,
            duration: duration,
            height: height,
          ),
        ],
      ),
    );
  }
}

class SkillSetCardView extends StatefulWidget {
  const SkillSetCardView({
    Key key,
    @required this.screenSize,
    @required this.duration,
    @required this.height,
  }) : super(key: key);

  final Size screenSize;
  final Duration duration;
  final double height;

  @override
  _SkillSetCardViewState createState() => _SkillSetCardViewState();
}

class _SkillSetCardViewState extends State<SkillSetCardView> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new GridView.count(
        crossAxisCount: widget.screenSize.width > 600 ? 3 : 2,
        //childAspectRatio: 1.8, // height
        crossAxisSpacing: 20, // left right spacing
        mainAxisSpacing: 20, // top bottom spacing
        shrinkWrap: true,
        children: List.generate(
          skillSet.length,
          (index) => InkWell(
            onTap: () {},
            hoverColor: Colors.transparent,
            onHover: (value) {
              setState(() {
                isHover = value;
              });
            },
            child: AnimatedContainer(
              duration: widget.duration,
              margin: EdgeInsets.only(top: kDefaultPadding * 3),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: widget.height,
              width: 350,
              decoration: BoxDecoration(
                color: skillSet[index].color,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [if (isHover) kDefaultCardShadow],
              ),
              child: Column(
                children: [
                  Transform.translate(
                    offset: Offset(0, -55),
                    child: AnimatedContainer(
                      duration: widget.duration,
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 10),
                        boxShadow: [if (!isHover) kDefaultCardShadow],
                        /*image: DecorationImage(
                          image: AssetImage(skillSet[index].skillsImages),
                        ),*/
                      ),
                    ),
                  ),
                  Text(
                    skillSet[index].desc,
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: kDefaultPadding * 2),
                  Text(
                    "Ronald Thompson",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
