import 'package:color_quiz/db/connector.dart';
import 'package:color_quiz/quiz.dart';
import 'package:flutter/material.dart';

import 'db/entities/score.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: DBProvider.db.getAllScoresSorted(),
          builder: (BuildContext context, AsyncSnapshot<List<Score>> snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 400,
                    width: 350,
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        Score score = snapshot.data[index];
                        return Card(
                          child: ListTile(
                            leading: Text('${index + 1}.'),
                            title: Text(score.name),
                            trailing: Text(score.points.toString()),
                          ),
                        );
                      },
                    ),
                  ),
                  Center(
                    child: RaisedButton(
                      child: Text('Start Quiz'),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                              return Quiz();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
