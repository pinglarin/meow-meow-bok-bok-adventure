import 'package:wireless_term_project/screens/game_screen.dart';
import 'package:flutter_test/flutter_test.dart';
void main(){

  test("parse JSON", () {
    String mockName = "Pingping";
    int mockScore = 100;
    String j = "{\"name\": \"$mockName\", \"score\": $mockScore}";
    Map d = parseJSON(j);
    expect(mockName, d["name"]);
    expect(mockScore, d["score"]);

  });
  
}