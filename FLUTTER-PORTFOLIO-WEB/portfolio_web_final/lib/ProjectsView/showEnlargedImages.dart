import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ShowImages extends StatelessWidget {
  final int photo;

  ShowImages({this.photo});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        // You can do some work here.
        // Returning true allows the pop to happen, returning false prevents it.
        return true;
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: height * 0.03),
        child: PhotoView(
          imageProvider: AssetImage("assets/images/$photo.png"),
          backgroundDecoration: BoxDecoration(color: Colors.white),
        ),
      ),
    );
  }
}
