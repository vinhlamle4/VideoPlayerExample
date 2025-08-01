import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player_example/utils/app_theme.dart';

final settingViewModelProvider = ChangeNotifierProvider((ref) => SettingViewModel(ref));

class SettingViewModel extends ChangeNotifier {
  SettingViewModel(this._ref);
  final Ref _ref;


  late StateController<ThemeMode> themeMode = _ref.read(appThemeModeProvider.notifier);
  late AppTheme theme = _ref.read(appThemeProvider);

  bool _needCheckSystemTheme = true;
  bool get needCheckSystemTheme => _needCheckSystemTheme;

  changeToDarkTheme() {
    themeMode.state = ThemeMode.dark;
  }

  changeToLightTheme() {
    themeMode.state = ThemeMode.light;
  }

  getSystemThemeMode(Brightness systemBrightness) {
    if (systemBrightness == Brightness.dark && needCheckSystemTheme) {
      _needCheckSystemTheme = false;
      changeToDarkTheme();
      notifyListeners();
    }
  }

  updateCheckSystemTheme() {
    _needCheckSystemTheme = true;
  }
}