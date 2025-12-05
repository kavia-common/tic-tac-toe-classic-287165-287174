import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe_frontend/main.dart';

void main() {
  testWidgets('Home shows mode selector', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());
    await tester.pumpAndSettle();

    expect(find.text('Choose Mode'), findsOneWidget);
    expect(find.text('Player vs Player'), findsOneWidget);
    expect(find.text('Player vs Computer'), findsOneWidget);
  });

  testWidgets('Navigate to game screen', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Player vs Player'));
    await tester.pumpAndSettle();

    expect(find.text('Player vs Player'), findsOneWidget);
    expect(find.text('New Round'), findsOneWidget);
  });
}
