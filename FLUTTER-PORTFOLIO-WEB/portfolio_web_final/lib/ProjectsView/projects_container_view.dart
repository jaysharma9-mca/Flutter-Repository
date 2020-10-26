import 'package:flutter/material.dart';
import 'package:portfolio_web_final/constants.dart';
import 'project_work.dart';
import 'showEnlargedImages.dart';

class ProjectsContainer extends StatefulWidget {
  const ProjectsContainer({
    Key key,
    @required this.press,
    this.index,
  }) : super(key: key);

  //final Size screenSize;
  final Function press;
  final int index;

  @override
  _ProjectsContainerState createState() => _ProjectsContainerState();
}

class _ProjectsContainerState extends State<ProjectsContainer> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: widget.press,
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        //height: screenSize.height * 0.50,
        width: screenSize.width * 0.40,
        decoration: BoxDecoration(
          boxShadow: [if (isHover) kDefaultCardShadow],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowImages(
                            photo: widget.index + 1,
                          ),
                        ));
                  },
                  child: Image.asset(
                    projectWork[widget.index].image,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
