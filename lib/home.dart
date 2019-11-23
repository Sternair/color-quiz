import 'package:color_quiz/quiz.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: RaisedButton(
                  child: Text('Start Quiz'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                      return Quiz();
                    }));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
