import 'package:flutter/material.dart';

class SelectedColorPainter extends CustomPainter {
  Color color;

  SelectedColorPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // set the color property of the paint
    paint.color = this.color;
    // center of the canvas is (x,y) => (width/2, height/2)
    var center = Offset(size.width / 2, size.height / 2);

    // draw the circle on centre of canvas having radius 75.0
    canvas.drawCircle(center, 75.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
