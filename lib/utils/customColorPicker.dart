import 'package:flutter/cupertino.dart';

import 'mapValueToRange.dart';

class CustomColorPicker extends StatefulWidget {
  final ValueChanged<Color> onColorChanged;

  CustomColorPicker({@required this.onColorChanged});

  @override
  State<StatefulWidget> createState() => CustomColorPickerState();
}

class CustomColorPickerState extends State<CustomColorPicker> {
  GlobalKey _rainbowPickerKey = GlobalKey();
  double _maxHeight;

  int _selectedR;
  int _selectedG;
  int _selectedB;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Container(
                width: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: const <Color>[
                      Color(0xFFFFFFFF),
                      Color(0xFFFF0000),
                      Color(0xFF000000),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              GestureDetector(
                onPanUpdate: (details) {
                  double y = details.localPosition.dy;
                  if (y < 0 || y > this._maxHeight) {
                    return;
                  }
                  setState(() {
                    if (y < _maxHeight / 6) {
                      // red -> yellow
                      this._selectedR = 255;
                      this._selectedG = getMappedColorRangeValue(
                          input: y,
                          inputStart: 0.0,
                          inputEnd: _maxHeight / 6,
                          outputStart: 0,
                          outputEnd: 255);
                      this._selectedB = 0;
                    } else if (y < _maxHeight / 6 * 2) {
                      // -> green
                      this._selectedR = getMappedColorRangeValue(
                          input: y,
                          inputStart: _maxHeight / 6,
                          inputEnd: _maxHeight / 6 * 2,
                          outputStart: 255,
                          outputEnd: 0);
                      this._selectedG = 255;
                      this._selectedB = 0;
                    } else if (y < _maxHeight / 6 * 3) {
                      // -> teal
                      this._selectedR = 0;
                      this._selectedG = 255;
                      this._selectedB = getMappedColorRangeValue(
                          input: y,
                          inputStart: _maxHeight / 6 * 2,
                          inputEnd: _maxHeight / 6 * 3,
                          outputStart: 0,
                          outputEnd: 255);
                    } else if (y < _maxHeight / 6 * 4) {
                      // -> blue
                      this._selectedR = 0;
                      this._selectedG = getMappedColorRangeValue(
                          input: y,
                          inputStart: _maxHeight / 6 * 3,
                          inputEnd: _maxHeight / 6 * 4,
                          outputStart: 255,
                          outputEnd: 0);
                      this._selectedB = 255;
                    } else if (y < _maxHeight / 6 * 5) {
                      // -> pink
                      this._selectedR = getMappedColorRangeValue(
                          input: y,
                          inputStart: _maxHeight / 6 * 4,
                          inputEnd: _maxHeight / 6 * 5,
                          outputStart: 0,
                          outputEnd: 255);
                      this._selectedG = 0;
                      this._selectedB = 255;
                    } else {
                      // -> red
                      this._selectedR = 255;
                      this._selectedG = 0;
                      this._selectedB = getMappedColorRangeValue(
                          input: y,
                          inputStart: _maxHeight / 6 * 5,
                          inputEnd: _maxHeight,
                          outputStart: 255,
                          outputEnd: 0);
                    }

                    widget.onColorChanged(Color.fromRGBO(this._selectedR,
                        this._selectedG, this._selectedB, 1.0));
                    // print('$_selectedR|$_selectedG|$_selectedB');
                  });
                },
                child: Container(
                  key: _rainbowPickerKey,
                  width: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: const <Color>[
                        Color(0xFFFF0000),
                        Color(0xFFFFFF00),
                        Color(0xFF00FF00),
                        Color(0xFF00FFFF),
                        Color(0xFF0000FF),
                        Color(0xFFFF00FF),
                        Color(0xFFFF0000),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  _afterLayout(_) {
    _setMaxHeight();
  }

  void _setMaxHeight() {
    final RenderBox _tmp = _rainbowPickerKey.currentContext.findRenderObject();
    this._maxHeight = _tmp.size.height;
    print(this._maxHeight);
  }
}
