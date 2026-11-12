import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  // Palet utama: ink hijau tua, kertas hangat, dan aksen bronze.
  static const Color _ink = Color(0xFF25332E);
  static const Color _paper = Color(0xFFF6F3EC);
  static const Color _paperCard = Color(0xFFFFFCF6);
  static const Color _bronze = Color(0xFF9A7B4F);
  static const Color _line = Color(0xFFDCD5C7);

  static const Color _darkCanvas = Color(0xFF121614);
  static const Color _darkCard = Color(0xFF1B211E);
  static const Color _sage = Color(0xFFA9BDB3);

  static ThemeData light() => _build(Brightness.light);

  static ThemeData dark() => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final bool isDark = brightness == Brightness.dark;
    final ColorScheme base = ColorScheme.fromSeed(
      seedColor: isDark ? _sage : _ink,
      brightness: brightness,
    );

    final ColorScheme scheme = isDark
        ? base.copyWith(
            primary: _sage,
            onPrimary: const Color(0xFF1B2923),
            primaryContainer: const Color(0xFF2D4037),
            onPrimaryContainer: const Color(0xFFDCE8E1),
            secondary: const Color(0xFFD2B98F),
            onSecondary: const Color(0xFF2E2212),
            secondaryContainer: const Color(0xFF433624),
            onSecondaryContainer: const Color(0xFFF0E1C8),
            surface: _darkCard,
            onSurface: const Color(0xFFE5E9E5),
            surfaceContainerHighest: const Color(0xFF2A302C),
            outline: const Color(0xFF8C948F),
            outlineVariant: const Color(0xFF3B433E),
          )
        : base.copyWith(
            primary: _ink,
            onPrimary: _paperCard,
            primaryContainer: const Color(0xFFDDE6E0),
            onPrimaryContainer: const Color(0xFF17231E),
            secondary: _bronze,
            onSecondary: const Color(0xFF2A1E0E),
            secondaryContainer: const Color(0xFFEFE4D2),
            onSecondaryContainer: const Color(0xFF392B18),
            surface: _paperCard,
            onSurface: const Color(0xFF1B1D1B),
            surfaceContainerHighest: const Color(0xFFEDE8DD),
            outline: const Color(0xFF8C887E),
            outlineVariant: _line,
          );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      fontFamily: 'Roboto',
      scaffoldBackgroundColor: isDark ? _darkCanvas : _paper,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: isDark ? _darkCanvas : _paper,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: scheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(color: scheme.outlineVariant),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: scheme.outlineVariant),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: scheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: scheme.primary, width: 1.4),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        side: BorderSide(color: scheme.outlineVariant),
      ),
      dividerTheme: DividerThemeData(color: scheme.outlineVariant, space: 1),
      textTheme: const TextTheme(
        headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        bodyMedium: TextStyle(fontSize: 14, height: 1.5),
      ),
    );
  }
}
