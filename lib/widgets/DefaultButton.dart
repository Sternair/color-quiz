import 'package:flutter/material.dart';

import '../theme.dart';

class DefaultButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String label;

  DefaultButton({@required this.onPressed, @required this.label});

  @override
  Widget build(BuildContext context) {
    return new OutlineButton(
        child: Text(label),
        onPressed: onPressed,
        color: COLOR_WHITE,
        textColor: COLOR_WHITE,
        borderSide: BorderSide(color: COLOR_WHITE, style: BorderStyle.solid),
        shape: new StadiumBorder());
  }
}
