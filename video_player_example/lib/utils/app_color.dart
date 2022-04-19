import 'package:flutter/material.dart';

class AppColors {
  final Color primary;
  final Color accent;
  final Color secondary;
  final Color icon;
  final Color text;
  final Color mediaText;
  final Color videoPlayerBackground;
  final Color progressBackground;
  final Color progressBuffered;
  final Color progressPlayed;
  final Color splash;
  final Color divider;

  const AppColors({
    required this.primary,
    required this.accent,
    required this.secondary,
    required this.icon,
    required this.text,
    required this.mediaText,
    required this.videoPlayerBackground,
    required this.progressBackground,
    required this.progressBuffered,
    required this.progressPlayed,
    required this.splash,
    required this.divider,
  });

  factory AppColors.light() {
    return AppColors(
      primary: Colors.white,
      accent: const Color.fromRGBO(169, 169, 169, 1),
      secondary: Colors.white30,
      icon: Colors.white,
      text: Colors.black54,
      mediaText: Colors.white,
      videoPlayerBackground: Colors.black,
      progressBackground: Colors.white24,
      progressBuffered: Colors.white38,
      progressPlayed: Colors.white,
      splash: Colors.black.withOpacity(0.3),
      divider: Colors.black,
    );
  }

  factory AppColors.dark() {
    return AppColors(
      primary: const Color.fromRGBO(27, 27, 27, 1),
      accent: const Color.fromRGBO(169, 169, 169, 1),
      secondary: Colors.black38,
      icon: Colors.white,
      text: Colors.white,
      mediaText: Colors.white,
      videoPlayerBackground: Colors.black,
      progressBackground: Colors.white24,
      progressBuffered: Colors.white38,
      progressPlayed: Colors.white,
      splash: Colors.white.withOpacity(0.3),
      divider: Colors.white,
    );
  }
}
