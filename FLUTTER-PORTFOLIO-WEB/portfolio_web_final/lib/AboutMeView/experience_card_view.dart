import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ExperienceCardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(0xFFF7E8FF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xFFEDD2FC),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              blurRadius: 6,
              color: Color(0xFFA600FF).withOpacity(0.25),
            ),
          ],
        ),
        child: FittedBox(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Text(
                  '05',
                  style: TextStyle(
                    fontSize: 90,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      BoxShadow(
                        offset: Offset(0, 5),
                        blurRadius: 10,
                        color: Color(0xFFA600FF).withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
              ),
              FittedBox(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: AutoSizeText(
                    "Years of Experience",
                    style: TextStyle(
                      color: Color(0xFFA600FF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
