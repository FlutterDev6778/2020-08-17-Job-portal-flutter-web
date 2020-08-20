import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeChanged extends ThemeEvent {
  final String themeMode;

  const ThemeChanged({@required this.themeMode});

  @override
  List<Object> get props => [themeMode];

  @override
  String toString() => 'ThemeChanged { themeMode :$themeMode }';
}
