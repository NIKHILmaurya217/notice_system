// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:notice_system/main.dart';

void main() {
  testWidgets('Notice system smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const NoticeBoardApp());

    // Verify that the app title is present.
    expect(find.text('College Notice System'), findsWidgets);

    // Verify that the initial notices are present.
    expect(find.text('Welcome to the Flutter Peer-to-Peer Learning Class!'), findsOneWidget);

    // verify that the hint text for the text field is present.
    expect(find.text('Enter a new notice...'), findsOneWidget);

    // Enter a new notice and tap the post button.
    await tester.enterText(find.byType(TextField), 'This is a test notice');
    await tester.tap(find.text('Post Notice'));
    
    // trigger a frame to allow the UI to update.
    await tester.pump();

    // verify that the new notice was added to the list.
    expect(find.text('This is a test notice'), findsOneWidget);
  });
}
