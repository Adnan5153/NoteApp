import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

/// Centralized ThemeData factories.
///
/// Both [light] and [dark] are built from a shared [_build] helper so the
/// two themes always stay visually consistent. To customize either theme,
/// tweak the corresponding `AppPalette` block below — the rest of the
/// Material 3 styling (shapes, radii, button styles) is shared.
class AppTheme {
  AppTheme._();

  /// Light theme used when [ThemeMode.system] resolves to light or
  /// when [ThemeMode.light] is explicitly selected.
  static ThemeData get light => _build(_lightPalette);

  /// Dark theme used when [ThemeMode.system] resolves to dark or
  /// when [ThemeMode.dark] is explicitly selected.
  static ThemeData get dark => _build(_darkPalette);

  // --- Palettes ---

  static const _AppPalette _lightPalette = _AppPalette(
    brightness: Brightness.light,
    primary: AppColors.primary,
    accent: AppColors.accent,
    background: AppColors.background,
    surface: AppColors.surface,
    cardBorder: AppColors.cardBorder,
    textPrimary: AppColors.textPrimary,
    textSecondary: AppColors.textSecondary,
    textOnPrimary: AppColors.textOnPrimary,
    danger: AppColors.danger,
  );

  static const _AppPalette _darkPalette = _AppPalette(
    brightness: Brightness.dark,
    primary: AppColors.primaryDark,
    accent: AppColors.accentDark,
    background: AppColors.backgroundDark,
    surface: AppColors.surfaceDark,
    cardBorder: AppColors.cardBorderDark,
    textPrimary: AppColors.textPrimaryDark,
    textSecondary: AppColors.textSecondaryDark,
    textOnPrimary: AppColors.textPrimaryDark,
    danger: AppColors.dangerDark,
  );

  // --- Builder ---

  static ThemeData _build(_AppPalette p) {
    final colorScheme = ColorScheme(
      brightness: p.brightness,
      primary: p.primary,
      onPrimary: p.textOnPrimary,
      secondary: p.accent,
      onSecondary: p.textOnPrimary,
      surface: p.surface,
      onSurface: p.textPrimary,
      error: p.danger,
      onError: p.textOnPrimary,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: p.brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: p.background,
      appBarTheme: AppBarTheme(
        backgroundColor: p.primary,
        foregroundColor: p.textOnPrimary,
        elevation: 0,
        centerTitle: true,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: p.primary,
        foregroundColor: p.textOnPrimary,
      ),
      cardTheme: CardThemeData(
        color: p.surface,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: p.cardBorder),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: p.surface,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        labelStyle: TextStyle(color: p.textSecondary),
        hintStyle: TextStyle(color: p.textSecondary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: p.cardBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: p.cardBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: p.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: p.danger),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: p.danger, width: 1.5),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: p.primary,
          foregroundColor: p.textOnPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: p.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: p.textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: TextStyle(
          color: p.textSecondary,
          fontSize: 14,
        ),
      ),
      dividerColor: p.cardBorder,
      iconTheme: IconThemeData(color: p.textPrimary),
    );
  }
}

/// Internal bundle of role-specific colors passed into [_build].
/// Fields are intentionally minimal — only what AppTheme needs to vary
/// between light and dark.
class _AppPalette {
  final Brightness brightness;
  final Color primary;
  final Color accent;
  final Color background;
  final Color surface;
  final Color cardBorder;
  final Color textPrimary;
  final Color textSecondary;
  final Color textOnPrimary;
  final Color danger;

  const _AppPalette({
    required this.brightness,
    required this.primary,
    required this.accent,
    required this.background,
    required this.surface,
    required this.cardBorder,
    required this.textPrimary,
    required this.textSecondary,
    required this.textOnPrimary,
    required this.danger,
  });
}
