# Module 5 - Activity 4 - Tap through to detail (Flutter)

[![Made with Claude](https://img.shields.io/badge/Made_with-Claude-D97757?logo=anthropic&logoColor=white)](https://tjakoen.github.io/notes/ten-times-zero)
![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)

Move between screens. Tap a monster in the list to open its detail page.

## Build this

In `lib/dex_home.dart`:

- `DexHome` lists the monsters it is given (a `ListTile` each is fine).
- Tapping a monster does `Navigator.push` to a detail screen for THAT monster.
- The detail screen is a `Scaffold` with an `AppBar` (so it gets a back button),
  and shows the type in a `Text` keyed `Key('detailType')`.

Research: `Navigator.push`, `MaterialPageRoute`, passing data through a
constructor, `onTap`.

## Run and check

```bash
flutter pub get
flutter run
flutter test
```

## Submit

Fill in `student.json`, commit, and push.
