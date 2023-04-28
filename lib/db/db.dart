
class ScoreRecord {
  DateTime created;
  String name;
  num score;

  ScoreRecord(this.created, this.name, this.score);
}

abstract class DB {

  Future<List<ScoreRecord>> getAllScore();
  addScore(DateTime dt, String name, num score);

}