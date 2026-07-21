// m5a4 - Tap through to detail: behaviour checks (canonical overlay).
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:m5a4_tap_detail/monster.dart';
import 'package:m5a4_tap_detail/dex_home.dart';

const monsters = [
  Monster(name: 'Emberling', type: 'fire', hp: 30, maxHp: 40),
  Monster(name: 'Aquaphin', type: 'water', hp: 18, maxHp: 25),
];

Future<void> pump(WidgetTester tester) async {
  await tester.pumpWidget(const MaterialApp(home: DexHome(monsters: monsters)));
}

void main() {
  test('student.json is filled in', () {
    final info = jsonDecode(File('student.json').readAsStringSync())
        as Map<String, dynamic>;
    for (final field in [
      'classCode',
      'fullName',
      'studentNumber',
      'studentEmail',
      'personalEmail',
      'githubAccount',
    ]) {
      expect(info[field], isNotEmpty, reason: 'Set "$field" in student.json');
    }
  });

  group('DexHome navigation', () {
    testWidgets('lists the monsters on the home screen', (tester) async {
      await pump(tester);
      expect(find.text('Emberling'), findsOneWidget);
      expect(find.text('Aquaphin'), findsOneWidget);
    });

    testWidgets('tapping a monster opens a detail screen for it',
        (tester) async {
      await pump(tester);
      await tester.tap(find.text('Aquaphin'));
      await tester.pumpAndSettle();
      // The detail screen shows the type in a Text keyed 'detailType'.
      final f = find.byKey(const Key('detailType'));
      expect(f, findsOneWidget,
          reason:
              'Navigator.push a detail screen that shows the type keyed Key(\'detailType\').');
      expect((tester.widget<Text>(f).data ?? '').toLowerCase(), contains('water'),
          reason: 'The detail must be for the monster that was tapped.');
    });

    testWidgets('the detail screen can be popped (has a back button)',
        (tester) async {
      await pump(tester);
      await tester.tap(find.text('Emberling'));
      await tester.pumpAndSettle();
      expect(find.byType(BackButton), findsOneWidget,
          reason: 'A pushed route gets a back button automatically - keep the AppBar.');
    });
  });
}
