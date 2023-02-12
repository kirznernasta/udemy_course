import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('I am poor'),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(171, 143, 242, 100),
        ),
        backgroundColor: Color.fromRGBO(213, 187, 242, 100),
        body: Center(
          child: Image(
            image: AssetImage('images/man-holding-an-empty-wallet.jpg'),
          ),
        ),
      ),
    ),
  );
}
