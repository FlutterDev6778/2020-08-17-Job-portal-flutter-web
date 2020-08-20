import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import './index.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(ThemeState initialState) : super(initialState);

  ThemeState get initialState => ThemeState.init();

  @override
  Stream<Transition<ThemeEvent, ThemeState>> transformEvents(events, transitionFn) {
    return super.transformEvents(events, transitionFn);
  }

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ThemeChanged) {
      yield* _mapThemeChangedToState(event.themeMode);
    }
  }

  Stream<ThemeState> _mapThemeChangedToState(String themeMode) async* {
    yield state.update(
      themeMode: themeMode,
    );
  }
}
