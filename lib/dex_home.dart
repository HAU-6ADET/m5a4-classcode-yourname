import 'package:flutter/material.dart';

import 'monster.dart';

/// Module 5 - Activity 4 - Tap through to detail
///
/// Move between screens. `DexHome` shows a list of monsters; tapping one must
/// `Navigator.push` a detail screen for THAT monster.
///
///   * `DexHome` lists the monsters (a `ListTile` per monster is fine).
///   * Tapping a monster opens a detail screen (a `Scaffold` with an `AppBar`,
///     so it gets a back button automatically).
///   * The detail screen shows the monster's type in a `Text` keyed
///     `Key('detailType')`.
///
/// Concepts to research: `Navigator.push`, `MaterialPageRoute`, passing data to
/// a new screen through its constructor, and `onTap`.
class DexHome extends StatelessWidget {
  final List<Monster> monsters;

  const DexHome({super.key, required this.monsters});

  @override
  Widget build(BuildContext context) {
    // TODO: list the monsters; on tap, Navigator.push a MonsterDetailScreen.
    return Scaffold(
      appBar: AppBar(title: const Text('HAUDEX')),
      body: const Center(child: Text('TODO: list the monsters')),
    );
  }
}

/// The screen you navigate TO. Build it to show the tapped monster.
class MonsterDetailScreen extends StatelessWidget {
  final Monster monster;

  const MonsterDetailScreen({super.key, required this.monster});

  @override
  Widget build(BuildContext context) {
    // TODO: a Scaffold with the name in the AppBar and the type keyed
    // Key('detailType').
    return Scaffold(
      appBar: AppBar(title: Text(monster.name)),
      body: const Center(child: Text('', key: Key('detailType'))),
    );
  }
}
