import 'package:flutter/material.dart';

import '../theme.dart';

class DefaultButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String label;
  final Color color;
  final bool outline;

  DefaultButton(
      {@required this.onPressed,
      @required this.label,
      this.color = COLOR_WHITE,
      this.outline = true});

  @override
  Widget build(BuildContext context) {
    return new OutlineButton(
        child: Text(label),
        onPressed: onPressed,
        color: this.color,
        textColor: this.color,
        borderSide: outline
            ? BorderSide(color: this.color, style: BorderStyle.solid)
            : null,
        shape: new StadiumBorder());
  }
}
