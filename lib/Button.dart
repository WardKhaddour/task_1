import 'package:flutter/material.dart';

import 'constants.dart';

class Button extends StatelessWidget {
  Button({this.onTap, this.textButton});

  final Function onTap;
  final String textButton;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        textButton,
        style: kButtonTextStyle,
      ),
    );
  }
}
