import 'package:meta/meta.dart';

import 'index.dart';

@immutable
class ThemeState {
  final String themeMode;

  ThemeState({
    @required this.themeMode,
  });

  factory ThemeState.init() {
    return ThemeState(
      themeMode: ThemeModeConstants.dark,
    );
  }

  ThemeState update({
    String themeMode,
  }) {
    return copyWith(
      themeMode: themeMode,
    );
  }

  ThemeState copyWith({
    String themeMode,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  String toString() {
    return '''ThemeState {
      themeMode: $themeMode,
    }''';
  }
}
