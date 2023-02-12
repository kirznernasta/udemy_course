import 'package:flutter/material.dart';
import 'constans.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function() onPress;

  ReusableCard(
      {required this.colour, required this.cardChild, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(kCardMarginForAllSides),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(kCardBorderRadius),
        ),
      ),
    );
  }
}
