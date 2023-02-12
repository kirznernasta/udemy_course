import 'package:flutter/material.dart';
import 'constans.dart';

class IconContent extends StatelessWidget {
  final String text;
  final IconData icon;

  IconContent({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: kIconSize,
        ),
        SizedBox(
          height: kSpaceBetweenIconAndText,
        ),
        Text(
          text,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
