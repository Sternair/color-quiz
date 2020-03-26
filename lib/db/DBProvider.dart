import 'dart:async';

import 'package:color_quiz/db/entities/score.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    await initDB();
    return _database;
  }

  initDB() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'scores_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE Scores(id INTEGER PRIMARY KEY, name TEXT, points INTEGER)",
        );
      },
      version: 1,
    );
    await insertScore(new Score(id: 1, name: 'Paul', points: 4000));
    await insertScore(new Score(id: 2, name: 'Bob', points: 3000));
    await insertScore(new Score(id: 3, name: 'Joe', points: 2000));
    await insertScore(new Score(id: 4, name: 'Ken', points: 1000));
  }

  Future<void> insertScore(Score scoreEntity) async {
    final Database db = await database;

    await db.insert(
      'scores',
      scoreEntity.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Score>> getAllScoresSorted() async {
    final db = await database;
    var res = await db.query("Scores", orderBy: "points DESC");

    return List.generate(res.length, (i) {
      return Score(
        id: res[i]['id'],
        name: res[i]['name'],
        points: res[i]['points'],
      );
    });
  }
}
