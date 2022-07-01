import 'package:flutter/material.dart';

class NewAppColors {
  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color inversePrimary;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color outline;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color inverseSurface;
  final Color inverseOnSurface;

  const NewAppColors({
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.inversePrimary,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.outline,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.inverseSurface,
    required this.inverseOnSurface,
  });

  factory NewAppColors.light() {
    return const NewAppColors(
        primary: Color(0xff6750a4),
        onPrimary: Colors.white,
        primaryContainer: Color(0xffeaddff),
        onPrimaryContainer: Color(0xff21005d),
        inversePrimary: Color(0xffd0bcff),
        secondary: Color(0xff625b71),
        onSecondary: Colors.white,
        secondaryContainer: Color(0xffe8def8),
        onSecondaryContainer: Color(0xff1d192b),
        tertiary: Color(0xff7d5260),
        onTertiary: Colors.white,
        tertiaryContainer: Color(0xffffd8e4),
        onTertiaryContainer: Color(0xff31111d),
        error: Color(0xffb3261e),
        onError: Colors.white,
        errorContainer: Color(0xfff9dedc),
        onErrorContainer: Color(0xff410e0b),
        outline: Color(0xff79747e),
        background: Color(0xfffffbfe),
        onBackground: Color(0xff1c1b1f),
        surface: Color(0xfffffbfe),
        onSurface: Color(0xff1c1b1f),
        surfaceVariant: Color(0xffe7e0ec),
        onSurfaceVariant: Color(0xff49454f),
        inverseSurface: Color(0xff313033),
        inverseOnSurface: Color(0xfff4eff4));
  }

  factory NewAppColors.dark() {
    return const NewAppColors(
        primary: Color(0xffd0bcff),
        onPrimary: Color(0xff381e72),
        primaryContainer: Color(0xff4f378b),
        onPrimaryContainer: Color(0xffeaddff),
        inversePrimary: Color(0xff6750a4),
        secondary: Color(0xffccc2dc),
        onSecondary: Color(0xff332d41),
        secondaryContainer: Color(0xff4a4458),
        onSecondaryContainer: Color(0xffe8def8),
        tertiary: Color(0xffefb8c8),
        onTertiary: Color(0xff492532),
        tertiaryContainer: Color(0xff633b48),
        onTertiaryContainer: Color(0xffffd8e4),
        error: Color(0xfff2b8b5),
        onError: Color(0xff601410),
        errorContainer: Color(0xff8c1d18),
        onErrorContainer: Color(0xfff2b8b5),
        outline: Color(0xff938f99),
        background: Color(0xff1c1b1f),
        onBackground: Color(0xffe6e1e5),
        surface: Color(0xff1c1b1f),
        onSurface: Color(0xffe6e1e5),
        surfaceVariant: Color(0xff49454f),
        onSurfaceVariant: Color(0xffcac4d0),
        inverseSurface: Color(0xffe6e1e5),
        inverseOnSurface: Color(0xff313033)
    );
  }
}
