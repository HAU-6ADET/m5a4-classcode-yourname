import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'monster.dart';
import 'dex_home.dart';

const _monsters = [
  Monster(name: 'Emberling', type: 'fire', hp: 30, maxHp: 40),
  Monster(name: 'Aquaphin', type: 'water', hp: 18, maxHp: 25),
  Monster(name: 'Sprout', type: 'grass', hp: 12, maxHp: 20),
];

// Entry point. Run it and tap a monster to open its detail. Your work is in
// `dex_home.dart`.
void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const HaudexApp(),
    ),
  );
}

class HaudexApp extends StatelessWidget {
  const HaudexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const DexHome(monsters: _monsters),
    );
  }
}
