import 'package:flutter/material.dart';

import '../../theme.dart';

enum ButtonType { action, primary, secondary }

class DefaultButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String label;
  final Color color;
  final ButtonType buttonType;

  DefaultButton(
      {@required this.onPressed,
      @required this.label,
      this.color = COLOR_WHITE,
      this.buttonType = ButtonType.primary});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: buttonType == ButtonType.action ? 45 : 40,
      child: OutlineButton(
        child: Text(
          label,
          style: TextStyle(fontSize: buttonType == ButtonType.action ? 28 : 18),
        ),
        onPressed: onPressed,
        color: this.color,
        textColor: this.color,
        borderSide: buttonType != ButtonType.secondary
            ? BorderSide(color: this.color, style: BorderStyle.solid, width: 2)
            : null,
        shape: new StadiumBorder(),
      ),
    );
  }
}
