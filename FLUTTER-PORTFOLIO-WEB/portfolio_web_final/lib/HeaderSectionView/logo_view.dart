import 'package:flutter/material.dart';

class LogoView extends StatelessWidget {
  const LogoView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: height * 0.04, horizontal: width * 0.06),
      child: FlutterLogo(
        size: height * 0.06,
      ),
    );
  }
}
