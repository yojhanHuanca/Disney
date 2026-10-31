import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color background = Color(0xFF0E111D);
  static const Color surface = Color(0xFF1A1D29);
  static const Color primary = Color(0xFF0063E5);
  static const Color muted = Color(0xFFB8BBC5);

  static ThemeData get dark {
    final base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: background,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: Color(0xFF02A8E0),
        surface: surface,
        onSurface: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: background,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: surface,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        clipBehavior: Clip.antiAlias,
      ),
      textTheme: GoogleFonts.interTextTheme(base.textTheme).apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        hintStyle: const TextStyle(color: muted),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: surface,
        selectedItemColor: Colors.white,
        unselectedItemColor: muted,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  // Fuente 1: Cinzel para títulos; Fuente 2: Inter para texto; Fuente 3: Oswald para chips.
  static TextStyle get heading => GoogleFonts.cinzel(
        fontWeight: FontWeight.w800,
        color: Colors.white,
      );

  static TextStyle get body => GoogleFonts.inter(color: Colors.white);

  static TextStyle get label => GoogleFonts.oswald(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.6,
      );
}
