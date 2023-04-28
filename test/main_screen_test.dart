import 'package:flutter_test/flutter_test.dart';
import 'package:wireless_term_project/main_screen.dart';

void main() {
  testWidgets('Check MainScreen titles', (tester) async {
    
    await tester.pumpWidget(const MainScreen());

    final titleEnFinder = find.text('MeowMeow & BokBok');
    final titlethFinder = find.text('เหมียวเหมียวบ๊อกบ๊อกผจญภัย');
    
    expect(titleEnFinder, findsOneWidget);
    expect(titlethFinder, findsOneWidget);
    
  });
}