import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSelectorCubit extends Cubit<ThemeMode> {
  ThemeSelectorCubit() : super(ThemeMode.system);

  void selectLightTheme() {
    emit(ThemeMode.light);
  }

  void selectDarkTheme() {
    emit(ThemeMode.dark);
  }

  void selectSystemTheme() {
    emit(ThemeMode.system);
  }

  void toggleTheme() {
    switch (state) {
      case ThemeMode.light:
        emit(ThemeMode.dark);
        break;
      case ThemeMode.dark:
        emit(ThemeMode.light);
        break;
      case ThemeMode.system:
        // When system theme, toggle based on current system brightness
        final brightness =
            WidgetsBinding.instance.platformDispatcher.platformBrightness;
        emit(brightness == Brightness.dark ? ThemeMode.light : ThemeMode.dark);
        break;
    }
  }
}
