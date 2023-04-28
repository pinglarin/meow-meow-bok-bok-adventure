import 'package:flutter_test/flutter_test.dart';
import 'package:wireless_term_project/screens/leaderboard.dart';

void main() {
  testWidgets('Check Leaderboard shows titles correctly', (tester) async {
    
    await tester.pumpWidget(LeaderboardScreen());
    await tester.pumpAndSettle();

    final dtTitleFinder = find.text('Datetime');
    final nameTitleFinder = find.text('Name');
    final scoreTitleFinder = find.text('Score');
    expect(dtTitleFinder, findsOneWidget);
    expect(nameTitleFinder, findsOneWidget);
    expect(scoreTitleFinder, findsOneWidget);
  });
}