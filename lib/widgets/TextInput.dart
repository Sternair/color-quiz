import 'package:color_quiz/constants.dart';
import 'package:color_quiz/utils/get_high_contrast_BW.dart';
import 'package:flutter/material.dart';

class TextInputForm extends StatefulWidget {
  final Color backgroundColor;
  final onTextChanged;

  const TextInputForm({Key key, this.backgroundColor, this.onTextChanged})
      : super(key: key);

  @override
  _TextInputFormState createState() => _TextInputFormState();
}

class _TextInputFormState extends State<TextInputForm> {
  final textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.text = DEFAULT_NAME;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: getHighContrastBW(widget.backgroundColor)),
      decoration:
          InputDecoration(filled: true, fillColor: widget.backgroundColor),
      controller: textEditingController,
      onChanged: widget.onTextChanged,
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
