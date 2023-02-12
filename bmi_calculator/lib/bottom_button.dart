import 'package:flutter/material.dart';
import 'constans.dart';

class BottomButton extends StatelessWidget {
  final Function() onPress;
  final String text;

  BottomButton({required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBottomContainerColour,
      height: kBottomContainerHeight,
      width: double.infinity,
      child: GestureDetector(
        onTap: onPress,
        child: Center(
          child: Text(
            text,
            style: kLargeTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
