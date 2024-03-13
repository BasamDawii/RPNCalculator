import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:calculator/main.dart'as app;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test RPN Calculator', (WidgetTester tester) async {
    // Start the app
    app.main();

    // Wait for the app to render
    await tester.pumpAndSettle();

    // Test user interactions and verify results
    // Example:
    // Tap the button '1'
    await tester.tap(find.text('1'));
    await tester.pump();

    // Verify that '1' is displayed in the first input field
    expect(find.text('1'), findsOneWidget);

    // Tap the button '+'
    await tester.tap(find.text('+'));
    await tester.pump();

    // Tap the button '2'
    await tester.tap(find.text('2'));
    await tester.pump();

    // Verify that '2' is displayed in the second input field
    expect(find.text('2'), findsOneWidget);

    // Tap the button 'Enter'
    await tester.tap(find.text('Enter'));
    await tester.pump();

    // Verify that the result is displayed correctly
    expect(find.text('3'), findsOneWidget);
  });
}