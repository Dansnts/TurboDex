// test/widget_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:turbodex_app/app.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('smoke test: app builds and shows bottom nav', (tester) async {
    await tester.pumpWidget(const TurboDexApp());
    // La RootShell affiche une NavigationBar
    expect(find.byType(NavigationBar), findsOneWidget);
  });
}
