import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Primary
  static const primary = Color(0xFF006E08);
  static const primaryContainer = Color(0xFF00AA13);
  static const onPrimary = Color(0xFFFFFFFF);
  static const onPrimaryContainer = Color(0xFF003402);
  static const primaryFixed = Color(0xFF76FF66);
  static const primaryFixedDim = Color(0xFF56E24B);
  static const inversePrimary = Color(0xFF56E24B);

  // Secondary
  static const secondary = Color(0xFF2A6C23);
  static const secondaryContainer = Color(0xFFA9F298);
  static const onSecondary = Color(0xFFFFFFFF);
  static const onSecondaryContainer = Color(0xFF2E7027);
  static const secondaryFixed = Color(0xFFACF59B);
  static const secondaryFixedDim = Color(0xFF91D881);

  // Tertiary
  static const tertiary = Color(0xFFB80963);
  static const tertiaryContainer = Color(0xFFFE4E97);
  static const onTertiary = Color(0xFFFFFFFF);
  static const onTertiaryContainer = Color(0xFF5B002D);
  static const tertiaryFixed = Color(0xFFFFD9E2);
  static const tertiaryFixedDim = Color(0xFFFFB1C8);

  // Surface hierarchy
  static const surface = Color(0xFFF8FAF8);
  static const surfaceDim = Color(0xFFD8DAD9);
  static const surfaceBright = Color(0xFFF8FAF8);
  static const surfaceContainerLowest = Color(0xFFFFFFFF);
  static const surfaceContainerLow = Color(0xFFF2F4F2);
  static const surfaceContainer = Color(0xFFECEEEC);
  static const surfaceContainerHigh = Color(0xFFE6E9E7);
  static const surfaceContainerHighest = Color(0xFFE1E3E1);
  static const surfaceVariant = Color(0xFFE1E3E1);
  static const surfaceTint = Color(0xFF006E08);
  static const inverseSurface = Color(0xFF2E3130);
  static const inverseOnSurface = Color(0xFFEFF1EF);

  // On-surface
  static const onSurface = Color(0xFF191C1B);
  static const onSurfaceVariant = Color(0xFF3E4A39);
  static const background = Color(0xFFF8FAF8);
  static const onBackground = Color(0xFF191C1B);

  // Outline
  static const outline = Color(0xFF6D7B67);
  static const outlineVariant = Color(0xFFBCCBB4);

  // Error
  static const error = Color(0xFFBA1A1A);
  static const errorContainer = Color(0xFFFFDAD6);
  static const onError = Color(0xFFFFFFFF);
  static const onErrorContainer = Color(0xFF93000A);
}

class AppShadows {
  static const cardAmbient = [
    BoxShadow(
      color: Color(0x0F191C1B),
      blurRadius: 32,
      offset: Offset(0, 12),
    ),
  ];

  static const bottomNav = [
    BoxShadow(
      color: Color(0x0A191C1B),
      blurRadius: 16,
      offset: Offset(0, -4),
    ),
  ];
}

class AppTheme {
  static ThemeData get light {
    final manrope = GoogleFonts.manropeTextTheme();
    final inter = GoogleFonts.interTextTheme();

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.surface,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        primaryContainer: AppColors.primaryContainer,
        onPrimary: AppColors.onPrimary,
        onPrimaryContainer: AppColors.onPrimaryContainer,
        secondary: AppColors.secondary,
        secondaryContainer: AppColors.secondaryContainer,
        onSecondary: AppColors.onSecondary,
        onSecondaryContainer: AppColors.onSecondaryContainer,
        tertiary: AppColors.tertiary,
        tertiaryContainer: AppColors.tertiaryContainer,
        onTertiary: AppColors.onTertiary,
        onTertiaryContainer: AppColors.onTertiaryContainer,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        onSurfaceVariant: AppColors.onSurfaceVariant,
        error: AppColors.error,
        errorContainer: AppColors.errorContainer,
        onError: AppColors.onError,
        onErrorContainer: AppColors.onErrorContainer,
        outline: AppColors.outline,
        outlineVariant: AppColors.outlineVariant,
        inverseSurface: AppColors.inverseSurface,
        inversePrimary: AppColors.inversePrimary,
        surfaceDim: AppColors.surfaceDim,
        surfaceBright: AppColors.surfaceBright,
        surfaceContainerLowest: AppColors.surfaceContainerLowest,
        surfaceContainerLow: AppColors.surfaceContainerLow,
        surfaceContainer: AppColors.surfaceContainer,
        surfaceContainerHigh: AppColors.surfaceContainerHigh,
        surfaceContainerHighest: AppColors.surfaceContainerHighest,
      ),
      textTheme: TextTheme(
        displayLarge: manrope.displayLarge?.copyWith(
          fontWeight: FontWeight.w800,
          letterSpacing: -0.02 * 57,
          color: AppColors.onSurface,
        ),
        displayMedium: manrope.displayMedium?.copyWith(
          fontWeight: FontWeight.w800,
          letterSpacing: -0.02 * 45,
          color: AppColors.onSurface,
        ),
        displaySmall: manrope.displaySmall?.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: -0.02 * 36,
          color: AppColors.onSurface,
        ),
        headlineLarge: manrope.headlineLarge?.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: -0.02 * 32,
          color: AppColors.onSurface,
        ),
        headlineMedium: manrope.headlineMedium?.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: -0.02 * 28,
          color: AppColors.onSurface,
        ),
        headlineSmall: manrope.headlineSmall?.copyWith(
          fontWeight: FontWeight.w700,
          color: AppColors.onSurface,
        ),
        titleLarge: inter.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.onSurface,
        ),
        titleMedium: inter.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.onSurface,
        ),
        titleSmall: inter.titleSmall?.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.onSurface,
        ),
        bodyLarge: inter.bodyLarge?.copyWith(
          color: AppColors.onSurface,
        ),
        bodyMedium: inter.bodyMedium?.copyWith(
          color: AppColors.onSurfaceVariant,
        ),
        bodySmall: inter.bodySmall?.copyWith(
          color: AppColors.onSurfaceVariant,
        ),
        labelLarge: inter.labelLarge?.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.onSurface,
        ),
        labelMedium: inter.labelMedium?.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.onSurfaceVariant,
        ),
        labelSmall: inter.labelSmall?.copyWith(
          fontWeight: FontWeight.w500,
          letterSpacing: 1.2,
          color: AppColors.onSurfaceVariant,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surfaceContainerLow,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: manrope.titleLarge?.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: AppColors.onSurface,
        ),
      ),
    );
  }
}
