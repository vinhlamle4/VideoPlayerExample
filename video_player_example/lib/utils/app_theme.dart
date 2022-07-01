import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player_example/utils/new_app_colors.dart';

final appThemeModeProvider =
    StateNotifierProvider<StateController<ThemeMode>, ThemeMode>(
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
  final NewAppColors appColors;

  AppTheme({
    required this.mode,
    required this.data,
    required this.appColors,
  });

  factory AppTheme.light() {
    const mode = ThemeMode.light;
    final appColors = NewAppColors.light();
    final themeData = ThemeData.light().copyWith(
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(color: appColors.secondary),
      scaffoldBackgroundColor: appColors.primary,
      iconTheme: IconThemeData(color: appColors.tertiary),
      textTheme: GoogleFonts.notoSansTextTheme(ThemeData.light().textTheme),
      splashColor: appColors.surface,
    );
    return AppTheme(
      mode: mode,
      data: themeData,
      appColors: appColors,
    );
  }

  factory AppTheme.dark() {
    const mode = ThemeMode.dark;
    final appColors = NewAppColors.dark();
    final themeData = ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(color: appColors.secondary),
      scaffoldBackgroundColor: appColors.primary,
      iconTheme: IconThemeData(color: appColors.tertiary),
      textTheme: GoogleFonts.notoSansTextTheme(ThemeData.dark().textTheme),
      splashColor: appColors.surface,
    );
    return AppTheme(
      mode: mode,
      data: themeData,
      appColors: appColors,
    );
  }
}
