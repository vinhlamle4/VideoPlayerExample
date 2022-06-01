import 'package:flutter/material.dart';

class Utils {

  static const double aspectRatio = 16/9;

  static Future<void> showBottomSheet(BuildContext context,
      {required Widget child}) async {
    await showModalBottomSheet(
      context: context,
      elevation: 10,
      builder: (BuildContext context) {
        return child;
      },
    );
  }

  static String convertDurationToTime(Duration value) {
    String twoDigit(int n) => n.toString().padLeft(2, "0");
    String seconds = twoDigit(value.inSeconds.remainder(60));
    String minutes = value.inMinutes.remainder(60).toString();
    return '$minutes:$seconds';
  }
}
