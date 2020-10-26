import 'package:flutter/material.dart';

import '../constants.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectedIndex = 0;
  int hoverIndex = 0;
  List<String> menuItems = [
    "Home",
    "About",
    "Projects",
    "Skills",
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 2.5,
      ),
      constraints: BoxConstraints(
        maxWidth: width * 0.87,
      ),
      //height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [kDefaultShadow],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            menuItems.length,
            (index) => //buildMenuItem(index),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  onHover: (value) {
                    setState(() {
                      value ? hoverIndex = index : hoverIndex = selectedIndex;
                    });
                  },
                  child: Container(
                    //constraints: BoxConstraints(minWidth: width * 0.085),
                    //height: height * 0.9,
                    /*_image == null
                        ? AssetImage('assets/images/avatar.jpg')
                        : Image.file(_image),*/
                    constraints: BoxConstraints(minWidth: width * 0.07),
                    height: height * 0.125,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          menuItems[index],
                          style: TextStyle(
                            fontSize: height * 0.025,
                            color: kTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Hover
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 200),
                          left: 0,
                          right: 0,
                          bottom: selectedIndex != index && hoverIndex == index
                              ? -20
                              : -45, // -45 hidden before hover out
                          child: Image.asset("assets/images/Hover.png"),
                        ),
                        // Select
                        AnimatedPositioned(
                          // Default Selection
                          duration: Duration(milliseconds: 200),
                          left: 0,
                          right: 0,
                          bottom: selectedIndex == index
                              ? -2
                              : -45, //-45 denotes hidden
                          child: Image.asset("assets/images/Hover.png"),
                        ),
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
