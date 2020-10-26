import 'package:flutter/material.dart';


class DetailScreen extends StatelessWidget {
  String title = "";
  String amount = "";
  DetailScreen({Key key, @required this.title, @required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Screen"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(title + " " + amount),
      ),
    );
  }
}