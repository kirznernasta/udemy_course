import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.light(
          primary: Color.fromRGBO(10, 14, 33, 1),
        ),
        scaffoldBackgroundColor: Color.fromRGBO(10, 14, 33, 1),
      ),
      home: InputPage(),
    );
  }
}
