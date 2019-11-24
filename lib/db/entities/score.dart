class Score {
  final int id;
  final String name;
  final int points;

  Score({this.id, this.name, this.points});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'points': points,
    };
  }
}
