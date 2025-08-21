import 'package:flutter/material.dart';

const _brand = Color(0xFFDC2626); // TurboDex red
const _brandDark = Color(0xFFB91C1C);

ThemeData buildTurboTheme(Brightness brightness) {
  final base = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _brand,
      brightness: brightness,
      primary: _brand,
      onPrimary: Colors.white,
      primaryContainer: _brandDark,
    ),
  );

  final cs = base.colorScheme;

  return base.copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: _brand,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _brand, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: _brand,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _brand,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    // ✅ FIX: use CardThemeData instead of CardTheme
    cardTheme: CardThemeData(
      elevation: 0,
      color: brightness == Brightness.dark
          ? cs.surfaceContainerHighest
          : cs.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.zero,
    ),
    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    ),
  );
}
