
import 'db.dart';
import 'package:firebase_database/firebase_database.dart';


class FirebaseDB extends DB {
  
  // https://dart.dev/language/constructors#factory-constructors
  static final FirebaseDB _singleton = FirebaseDB._internal();  
  factory FirebaseDB() {
    return _singleton;
  }
  FirebaseDB._internal();

  @override
  Future<void> addScore(DateTime dt, String name, num score) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    DatabaseReference scoreRef = ref.child("/score");
    // if(!scoreRef.){}
    DatabaseReference newScoreRef = scoreRef.push();
    newScoreRef.set({
      "timestamp": dt.millisecondsSinceEpoch,
      "name": name,
      "score": score
    });
  }
  
  @override
  Future<List<ScoreRecord>> getAllScore() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    DataSnapshot maybeScoreList = await ref.child("/scores").get();
    List<ScoreRecord> scoreRecord = [];
    if(maybeScoreList.exists){
      // Assume the scoreList is List<Map<String, dynamic>>
      List<Object?> scoreList = maybeScoreList.value as List<Object?>;
      scoreRecord.addAll(
        scoreList.map((e) {
          Map m = e as Map;
          return ScoreRecord(DateTime.fromMillisecondsSinceEpoch(m["timestamp"]), m["name"], m["score"]);
        })
      );
    }
    else{
      print("fetch failed, check in firebase");
    }
    scoreRecord.sort((a, b) => -a.score.compareTo(b.score));
    return scoreRecord;
  }
}
