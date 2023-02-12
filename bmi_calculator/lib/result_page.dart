import 'package:flutter/material.dart';
import 'constans.dart';
import 'reusable_card.dart';
import 'bottom_button.dart';

class ResultPage extends StatefulWidget {
  final String bmi;
  final String bmiInterpretation;
  final String result;

  ResultPage(
      {required this.bmi,
      required this.bmiInterpretation,
      required this.result});

  @override
  State<ResultPage> createState() => _ResultPageState(
      bmi: bmi, bmiInterpretation: bmiInterpretation, result: result);
}

class _ResultPageState extends State<ResultPage> {
  final String bmi;
  final String bmiInterpretation;
  final String result;

  _ResultPageState(
      {required this.bmi,
      required this.bmiInterpretation,
      required this.result});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                onPress: () {},
                colour: kActiveCardsColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      bmiInterpretation,
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmi,
                      style: kBMITextStyle,
                    ),
                    Text(
                      result,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              text: 'RECALCULATE',
              onPress: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
