import 'package:flutter/material.dart';

class AppColors {
  static Color primary300 = const Color(0xffa6b771);
  static Color primary500 = const Color(0xff4fbf48);
  static Color neutralD100 = const Color(0xff2e3d5e);
  static Color neutralD300 = const Color(0xff20283a);
  static Color neutralD500 = const Color(0xff151c2b);
  static Color neutralL500 = const Color(0xfff1f2f7);
  static Color neutralL800 = const Color(0xffc0c0c4);
  static Color neutralL900 = const Color(0xff757678);
  static Color white = const Color(0xfffafbfc);
  static Color black = Colors.black;
  static Color transparent = Colors.transparent;
  static Color error = const Color(0xfff55f8a);
  static Color warning = const Color(0xfffedf56);
  static Color success = const Color(0xff84d654);
}

/// Extension to convert a Color to a hex string
extension ColorExtension on Color {
  String toHex() {
    return '#${value.toRadixString(16).substring(2).toUpperCase()}';
  }
}
