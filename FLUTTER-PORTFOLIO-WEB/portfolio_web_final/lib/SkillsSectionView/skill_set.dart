import 'package:flutter/material.dart';

class SkillSet {
  final int id;
  final String skills;
  final String desc;
  final String skillsImages;
  final Color color;
  SkillSet({this.id, this.skills, this.desc, this.skillsImages, this.color});
}

List<SkillSet> skillSet = [
  SkillSet(
    id: 1,
    skills: "ANDROID",
    desc:
        "Android is a mobile operating system based on a modified version of the Linux kernel and other open source software, designed primarily for touchscreen mobile devices such as smartphone's and tablets.",
    skillsImages: "assets/images/android.png",
    color: Color(0xFFFFF3DD),
  ),
  SkillSet(
    id: 2,
    skills: "FLUTTER",
    desc:
        "Flutter is an open-source UI software development kit created by Google. It is used to develop applications for Android, iOS, Linux, Mac, Windows, Google Fuchsia, and the web from a single codebase",
    skillsImages: "assets/images/flutter.png",
    color: Color(0xFFD9FFFC),
  ),
  SkillSet(
    id: 3,
    skills: "UNIX SHELL SCRIPTING",
    desc:
        "A shell script is a computer program designed to be run by the Unix shell, a command-line interpreter.",
    color: Color(0xFFFFE0E0),
  ),
  SkillSet(
    id: 4,
    skills: "PL/SQL",
    desc:
        "PL/SQL is Oracle Corporation's procedural extension for SQL and the Oracle relational database.",
    skillsImages: "assets/images/android.png",
    color: Color(0xFFFFF3DD),
  ),
  SkillSet(
    id: 5,
    skills: "DEVOPS",
    desc:
        "DevOps is a set of practices that combines software development and IT operations.",
    skillsImages: "assets/images/devops.png",
    color: Color(0xFFFFF3DD),
  ),
  SkillSet(
    id: 6,
    skills: "PYTHON",
    desc:
        "Python is an interpreted, high-level and general-purpose programming language.",
    skillsImages: "assets/images/python.png",
    color: Color(0xFFFFF3DD),
  ),
];
