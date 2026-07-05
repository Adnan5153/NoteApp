// lib/core/constants/app_colors.dart

import 'package:flutter/material.dart';

class AppColors {
  // --- Primary Colors ---
  // Professional and sophisticated primary colors for a high-quality feel
  static const Color primary = Color(0xFF1A237E); // Deep Blue (Professional)
  static const Color primaryLight = Color(0xFF1565C0); // Lighter blue for accents
  static const Color primaryDarker = Color(0xFF0D1134);

  // --- Secondary Colors ---
  // Subdued and elegant colors that complement the primary color
  static const Color secondary = Color(0xFF8E24AA); // Sophisticated Purple

  /// Accent (used by ColorScheme.secondary in AppTheme).
  static const Color accent = secondary;

  // --- Brand Identity ---
  // These colors are used for buttons, primary actions, and headings
  static const Color brandColor = Color(0xFF1A237E);

  // --- Neutral Colors ---
  // A curated palette of grays and whites to maintain a clean, professional look.
  static const Color background = Color(0xFFF5F5F5); // Light Gray (Background)
  // Use white for main content areas
  static const Color surface = Color(0xFFFFFFFF);

  /// Subtle border color used around cards and inputs.
  static const Color cardBorder = Color(0xFFE0E0E0);

  // --- Text & Typography ---
  // Professional standard colors for text
  static const Color textPrimary = Color(0xFF212121); // Dark Gray/Black (Headline)
  static const Color textSecondary = Color(0xFF757575); // Medium Gray (Sub-headline)
  static const Color textLight = Color(0xFFB0B0B0);

  /// Color used for text rendered on top of primary-colored surfaces
  /// (e.g., AppBar title, FAB icon).
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // --- Status Colors ---
  // Standard colors for UI elements like notifications, errors, or success messages
  static const Color success = Color(0xFF2E7D32); // Green (Success)
  static const Color warning = Color(0xFFF1B400); // Amber/Yellow (Stronger vision)
  static const Color error = Color(0xFFD32F11);

  /// Alias used by AppTheme for destructive action accents.
  static const Color danger = error;

  // I added a selection highlight for sophisticated design.
  static const Color highlight = Color(0xFFE3E1FF); // A subtle, light purple-blue mix

  // --- Dark-mode tokens ---
  // Used by AppTheme.dark so light & dark stay visually consistent.
  static const Color primaryDark = Color(0xFF7986CB); // Lighter blue for contrast on dark surfaces
  static const Color backgroundDark = Color(0xFF121417); // Near-black app background
  static const Color surfaceDark = Color(0xFF1E2227); // Card / input surface
  static const Color cardBorderDark = Color(0xFF2C3138);
  static const Color textPrimaryDark = Color(0xFFE6E8EC); // Body / titles
  static const Color textSecondaryDark = Color(0xFFB0B4BA); // Captions / hints
  static const Color accentDark = Color(0xFFCE93D8); // Soft purple accent
  static const Color dangerDark = Color(0xFFEF9A9A); // Soft red for destructive UI
}