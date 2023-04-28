
import 'package:wireless_term_project/db/db.dart';

class MockDB extends DB{

  // https://dart.dev/language/constructors#factory-constructors
  static final MockDB _singleton = MockDB._internal();  
  factory MockDB() {
    return _singleton;
  }
  MockDB._internal();


  List<ScoreRecord> mockDB = [];
  @override
  addScore(DateTime dt, String name, num score) {
    mockDB.add(ScoreRecord(dt, name, score));
  }

  @override
  Future<List<ScoreRecord>> getAllScore() {
    return Future(() => mockDB);
  }
  
}