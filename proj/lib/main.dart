import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'I am rich',
          ),
          backgroundColor: Color.fromRGBO(38, 51, 88, 100),
        ),
        backgroundColor: Color.fromRGBO(46, 138, 199, 100),
        body: Center(
          child: Image(
            image: AssetImage('images/diamond.png'),
          ),
        ),
      ),
    ),
  );
}
