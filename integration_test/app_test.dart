import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/main.dart';

void main() {
  group('RPN Calculator Integration Tests', () {
    testWidgets('should allow entering values and perform subtraction', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      // Enter '5'
      await tester.enterText(find.byType(TextField), '5');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      // Enter '3'
      await tester.enterText(find.byType(TextField), '3');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      // Perform subtraction
      await tester.tap(find.text('-'));
      await tester.pump();

      // Verify the stack displays '2'
      expect(find.text('2.0'), findsOneWidget);
    });

    testWidgets('should allow entering values and perform multiplication', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      // Enter '4'
      await tester.enterText(find.byType(TextField), '4');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      // Enter '5'
      await tester.enterText(find.byType(TextField), '5');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      // Perform multiplication
      await tester.tap(find.text('×'));
      await tester.pump();

      // Verify the stack displays '20'
      expect(find.text('20.0'), findsOneWidget);
    });

    testWidgets('should allow entering values and perform division', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      // Enter '10'
      await tester.enterText(find.byType(TextField), '10');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      // Enter '2'
      await tester.enterText(find.byType(TextField), '2');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      // Perform division
      await tester.tap(find.text('÷'));
      await tester.pump();

      // Verify the stack displays '5'
      expect(find.text('5.0'), findsOneWidget);
    });

    testWidgets('should clear the stack when Clear is pressed', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      // Enter '10'
      await tester.enterText(find.byType(TextField), '10');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      // Ensure '10' is displayed
      expect(find.text('10.0'), findsOneWidget);

      // Press Clear
      await tester.tap(find.text('Clear'));
      await tester.pump();

      // Verify the stack is cleared and '10' is no longer displayed
      expect(find.text('10.0'), findsNothing);
    });
  });
}
