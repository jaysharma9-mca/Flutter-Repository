import 'package:flutter/material.dart';
import 'package:portfolio_web_final/SkillsSectionView/skill_set.dart';

import '../constants.dart';

class SkillSetCard extends StatefulWidget {
  SkillSetCard({
    this.rowIndex,
    this.index,
  });

  final int index;
  final int rowIndex;

  @override
  _SkillSetCardState createState() => _SkillSetCardState();
}

class _SkillSetCardState extends State<SkillSetCard> {
  Duration duration = Duration(milliseconds: 200);
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container();
  }
}
