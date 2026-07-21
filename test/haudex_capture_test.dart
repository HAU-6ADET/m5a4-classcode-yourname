// m5a4 - screenshot capture (teacher-canonical, NOT scored).
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:m5a4_tap_detail/monster.dart';
import 'package:m5a4_tap_detail/dex_home.dart';

import 'support/haudex_golden.dart';

void main() {
  setUpAll(loadHaudexFonts);

  testWidgets('capture: dex home', (tester) async {
    const monsters = [
      Monster(name: 'Emberling', type: 'fire', hp: 30, maxHp: 40),
      Monster(name: 'Aquaphin', type: 'water', hp: 18, maxHp: 25),
      Monster(name: 'Sprout', type: 'grass', hp: 12, maxHp: 20),
    ];
    await captureScreen(tester, const DexHome(monsters: monsters), name: 'home');
  });
}
