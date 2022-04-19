import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_color.dart';

final appThemeModeProvider = StateNotifierProvider<StateController<ThemeMode>, ThemeMode>(
      (ref) => StateController(ThemeMode.system),
);

final appThemeProvider = Provider<AppTheme>(
      (ref) {
    final mode = ref.watch(appThemeModeProvider);
    switch (mode) {
      case ThemeMode.dark:
        return AppTheme.dark();
      case ThemeMode.light:
      default:
        return AppTheme.light();
    }
  },
);

class AppTheme {
  final ThemeMode mode;
  final ThemeData data;
  final AppColors appColors;

  AppTheme({
    required this.mode,
    required this.data,
    required this.appColors,
  });

  factory AppTheme.light() {
    const mode = ThemeMode.light;
    final appColors = AppColors.light();
    final themeData = ThemeData.light().copyWith(
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(color: appColors.secondary),
      scaffoldBackgroundColor: appColors.primary,
      iconTheme: IconThemeData(color: appColors.icon),
      textTheme: GoogleFonts.notoSansTextTheme(ThemeData.light().textTheme),
      splashColor: appColors.splash,
    );
    return AppTheme(
      mode: mode,
      data: themeData,
      appColors: appColors,
    );
  }

  factory AppTheme.dark() {
    const mode = ThemeMode.dark;
    final appColors = AppColors.dark();
    final themeData = ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(color: appColors.secondary),
      scaffoldBackgroundColor: appColors.primary,
      iconTheme: IconThemeData(color: appColors.icon),
      textTheme: GoogleFonts.notoSansTextTheme(ThemeData.dark().textTheme),
      splashColor: appColors.splash,
    );
    return AppTheme(
      mode: mode,
      data: themeData,
      appColors: appColors,
    );
  }
}
