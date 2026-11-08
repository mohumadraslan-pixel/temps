// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:full_shopping_app_4/main.dart';

void main() {
  testWidgets('signup validates fields and creates an account',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text("Don't have an account? Sign up"));
    await tester.pumpAndSettle();

    final signupButton = find.widgetWithText(ElevatedButton, "Sign Up");
    await tester.tap(signupButton);
    await tester.pumpAndSettle();

    expect(find.text("Username must be at least 3 characters"), findsOneWidget);
    expect(find.text("Please enter a valid email"), findsOneWidget);
    expect(find.text("Password must be at least 6 characters"), findsOneWidget);

    final fields = find.byType(TextFormField);
    await tester.enterText(fields.at(0), "NewUser");
    await tester.enterText(fields.at(1), "new@example.com");
    await tester.enterText(fields.at(2), "secret1");
    await tester.enterText(fields.at(3), "different");
    await tester.ensureVisible(signupButton);
    await tester.tap(signupButton);
    await tester.pumpAndSettle();
    expect(find.text("Passwords do not match"), findsOneWidget);

    await tester.enterText(fields.at(3), "secret1");
    await tester.ensureVisible(signupButton);
    await tester.tap(signupButton);
    await tester.pumpAndSettle();

    expect(find.text("Account created, please login"), findsOneWidget);
    expect(find.text("Don't have an account? Sign up"), findsOneWidget);
  });
}
