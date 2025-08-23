import 'package:flutter/material.dart';

ThemeData buildTurboTheme(Brightness brightness) {
  final base = ThemeData(
    brightness: brightness,
    colorSchemeSeed: const Color(0xFFE11D48), // rouge TurboDex
    useMaterial3: true,
    fontFamily: 'Roboto',
  );

  return base.copyWith(
    cardTheme: const CardThemeData(
      elevation: 1,
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),
    appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
    ),
  );
}
