import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/results_page.dart';

import 'input_page.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff10163b),
        scaffoldBackgroundColor: Color(0xff0c1234),
      ),
      home: InputPage(),
      routes: <String, WidgetBuilder>{
        "/input_page": (context) => InputPage(),
        "/result_page": (context) => ResultPage(),
      },
    );
  }
}
