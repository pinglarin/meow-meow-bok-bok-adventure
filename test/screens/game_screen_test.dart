import 'package:wireless_term_project/db/firebase.dart';
import 'package:wireless_term_project/db/db.dart';
// import 'package:wireless_term_project/db/mockdb.dart';
// import 'package:wireless_term_project/screens/game_screen.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter/material.dart';

void main(){
  // testWidgets('Check Gamescreen', (tester) async {
    // Widget gs = GameScreen();
    // await tester.pumpWidget();

    // MockDB().mockDB
  
  // });
  // await tester.pumpAndSettle();

  DB db = FirebaseDB();

  db.addScore(DateTime.now(), "ac", 0);
  
}