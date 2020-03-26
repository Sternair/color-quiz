import 'package:color_quiz/utils/getHighContrastBW.dart';
import 'package:flutter/material.dart';

class TextInputForm extends StatefulWidget {
  final Color backgroundColor;
  final onTextChanged;
  final String initText;

  const TextInputForm(
      {Key key, this.backgroundColor, this.onTextChanged, this.initText})
      : super(key: key);

  @override
  _TextInputFormState createState() => _TextInputFormState();
}

class _TextInputFormState extends State<TextInputForm> {
  final textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.text = widget.initText;
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
