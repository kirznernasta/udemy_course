import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Ask me anything'),
          centerTitle: true,
          backgroundColor: Colors.lightBlue.shade900,
        ),
        body: BallPage(),
      ),
    ),
  ));
}

class BallPage extends StatefulWidget {
  const BallPage({Key? key}) : super(key: key);

  @override
  State<BallPage> createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  var answerNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(146, 155, 179, 100),
      child: Center(
        child: Expanded(
          child: TextButton(
              onPressed: () {
                setState(() {
                  answerNumber = Random().nextInt(5) + 1;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Image.asset('images/ball$answerNumber.png'),
              )),
        ),
      ),
    );
  }
}
