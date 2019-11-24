import 'package:color_quiz/db/DBProvider.dart';
import 'package:color_quiz/quiz.dart';
import 'package:flutter/material.dart';

import 'db/entities/score.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  Future<List<Score>> scoreList = DBProvider.db.getAllScoresSorted();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: scoreList,
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
                              return Quiz(
                                refreshData: () => _refreshData(),
                              );
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

  void _refreshData() {
    scoreList = DBProvider.db.getAllScoresSorted();
  }
}
