import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Defines the color palette for the light theme.
class LightModeColors {
  /// The primary color for the light theme.
  static const lightPrimary = Color(0xFFFF5E81);
  /// The color for text and icons displayed on top of the primary color in the light theme.
  static const lightOnPrimary = Color(0xFFFFFFFF);
  /// The primary container color for the light theme.
  static const lightPrimaryContainer = Color(0xFFFFC1A1);
  /// The color for text and icons displayed on top of the primary container color in the light theme.
  static const lightOnPrimaryContainer = Color(0xFF22223B);

  /// The secondary color for the light theme.
  static const lightSecondary = Color(0xFFFFC1A1);
  /// The color for text and icons displayed on top of the secondary color in the light theme.
  static const lightOnSecondary = Color(0xFF22223B);

  /// The tertiary color for the light theme.
  static const lightTertiary = Color(0xFF20CFC0);
  /// The color for text and icons displayed on top of the tertiary color in the light theme.
  static const lightOnTertiary = Color(0xFFFFFFFF);

  /// The error color for the light theme.
  static const lightError = Color(0xFFD32F2F);
  /// The color for text and icons displayed on top of the error color in the light theme.
  static const lightOnError = Color(0xFFFFFFFF);

  /// The highlight color for the light theme.
  static const lightHighlight = Color(
    0xFF673AB7,
  );
  /// The color for text and icons displayed on top of the highlight color in the light theme.
  static const lightOnHighlight = Color(0xFFFFFFFF);

  /// The background color for the light theme.
  static const lightBackground = Color(0xFFF2F2F2);
  /// The color for text and icons displayed on top of the background color in the light theme.
  static const lightOnBackground = Color(0xFF22223B);

  /// The surface color for the light theme.
  static const lightSurface = lightBackground;
  /// The color for text and icons displayed on top of the surface color in the light theme.
  static const lightOnSurface = lightOnBackground;
}

/// Defines the color palette for the dark theme.
class DarkModeColors {
  /// The primary color for the dark theme.
  static const darkPrimary = Color(0xFFFF5E81);
  /// The color for text and icons displayed on top of the primary color in the dark theme.
  static const darkOnPrimary = Color(0xFF232323);
  /// The primary container color for the dark theme.
  static const darkPrimaryContainer = Color(
    0xFFFF8FA3,
  );

  /// The secondary color for the dark theme.
  static const darkSecondary = Color(0xFFFFC1A1);
  /// The color for text and icons displayed on top of the secondary color in the dark theme.
  static const darkOnSecondary = Color(0xFF232323);

  /// The tertiary color for the dark theme.
  static const darkTertiary = Color(0xFF20CFC0);
  /// The color for text and icons displayed on top of the tertiary color in the dark theme.
  static const darkOnTertiary = Color(0xFFF2F2F2);

  /// The error color for the dark theme.
  static const darkError = Color(0xFFFF8A80);
  /// The color for text and icons displayed on top of the error color in the dark theme.
  static const darkOnError = Color(0xFF5D0000);

  /// The highlight color for the dark theme.
  static const darkHighlight = Color(
    0xFF673AB7,
  );
  /// The color for text and icons displayed on top of the highlight color in the dark theme.
  static const darkOnHighlight = Color(0xFFFFFFFF);

  /// The background color for the dark theme.
  static const darkBackground = Color(0xFF232323);
  /// The color for text and icons displayed on top of the background color in the dark theme.
  static const darkOnBackground = Color(0xFFF2F2F2);

  /// The surface color for the dark theme.
  static const darkSurface = darkBackground;
  /// The color for text and icons displayed on top of the surface color in the dark theme.
  static const darkOnSurface = darkOnBackground;
}

/// Defines the font sizes used throughout the application.
class FontSizes {
  /// Font size for display large text.
  static const double displayLarge = 57.0;
  /// Font size for display medium text.
  static const double displayMedium = 45.0;
  /// Font size for display small text.
  static const double displaySmall = 36.0;
  /// Font size for headline large text.
  static const double headlineLarge = 32.0;
  /// Font size for headline medium text.
  static const double headlineMedium = 24.0;
  /// Font size for headline small text.
  static const double headlineSmall = 22.0;
  /// Font size for title large text.
  static const double titleLarge = 22.0;
  /// Font size for title medium text.
  static const double titleMedium = 18.0;
  /// Font size for title small text.
  static const double titleSmall = 16.0;
  /// Font size for label large text.
  static const double labelLarge = 16.0;
  /// Font size for label medium text.
  static const double labelMedium = 14.0;
  /// Font size for label small text.
  static const double labelSmall = 12.0;
  /// Font size for body large text.
  static const double bodyLarge = 16.0;
  /// Font size for body medium text.
  static const double bodyMedium = 14.0;
  /// Font size for body small text.
  static const double bodySmall = 12.0;
}

/// Getter for the light theme [ThemeData].
ThemeData get lightTheme => ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: LightModeColors.lightPrimary,
        onPrimary: LightModeColors.lightOnPrimary,
        primaryContainer: LightModeColors.lightPrimaryContainer,
        onPrimaryContainer: LightModeColors.lightOnPrimaryContainer,
        secondary: LightModeColors.lightSecondary,
        onSecondary: LightModeColors.lightOnSecondary,
        tertiary: LightModeColors.lightTertiary,
        onTertiary: LightModeColors.lightOnTertiary,
        error: LightModeColors.lightError,
        onError: LightModeColors.lightOnError,
        surface: LightModeColors.lightSurface,
        onSurface: LightModeColors.lightOnSurface,
        background: LightModeColors.lightBackground,
        onBackground: LightModeColors.lightOnBackground,
        brightness: Brightness.light,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: LightModeColors
            .lightPrimaryContainer, // Use primaryContainer or any defined color
        foregroundColor: LightModeColors.lightOnPrimaryContainer,
        elevation: 0,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.inter(
          fontSize: FontSizes.displayLarge,
          fontWeight: FontWeight.normal,
        ),
        displayMedium: GoogleFonts.inter(
          fontSize: FontSizes.displayMedium,
          fontWeight: FontWeight.normal,
        ),
        displaySmall: GoogleFonts.inter(
          fontSize: FontSizes.displaySmall,
          fontWeight: FontWeight.w600,
        ),
        headlineLarge: GoogleFonts.inter(
          fontSize: FontSizes.headlineLarge,
          fontWeight: FontWeight.normal,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: FontSizes.headlineMedium,
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: GoogleFonts.inter(
          fontSize: FontSizes.headlineSmall,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: FontSizes.titleLarge,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: GoogleFonts.inter(
          fontSize: FontSizes.titleMedium,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: GoogleFonts.inter(
          fontSize: FontSizes.titleSmall,
          fontWeight: FontWeight.w500,
        ),
        labelLarge: GoogleFonts.inter(
          fontSize: FontSizes.labelLarge,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: GoogleFonts.inter(
          fontSize: FontSizes.labelMedium,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: GoogleFonts.inter(
          fontSize: FontSizes.labelSmall,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: FontSizes.bodyLarge,
          fontWeight: FontWeight.normal,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: FontSizes.bodyMedium,
          fontWeight: FontWeight.normal,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: FontSizes.bodySmall,
          fontWeight: FontWeight.normal,
        ),
      ),
    );

/// Getter for the dark theme [ThemeData].
ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.dark(
        primary: DarkModeColors.darkPrimary,
        onPrimary: DarkModeColors.darkOnPrimary,
        primaryContainer: DarkModeColors.darkPrimaryContainer,
        secondary: DarkModeColors.darkSecondary,
        onSecondary: DarkModeColors.darkOnSecondary,
        tertiary: DarkModeColors.darkTertiary,
        onTertiary: DarkModeColors.darkOnTertiary,
        error: DarkModeColors.darkError,
        onError: DarkModeColors.darkOnError,
        surface: DarkModeColors.darkSurface,
        onSurface: DarkModeColors.darkOnSurface,
        background: DarkModeColors.darkBackground,
        onBackground: DarkModeColors.darkOnBackground,
        brightness: Brightness.dark,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: DarkModeColors.darkPrimaryContainer,
        elevation: 0,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.inter(
          fontSize: FontSizes.displayLarge,
          fontWeight: FontWeight.normal,
        ),
        displayMedium: GoogleFonts.inter(
          fontSize: FontSizes.displayMedium,
          fontWeight: FontWeight.normal,
        ),
        displaySmall: GoogleFonts.inter(
          fontSize: FontSizes.displaySmall,
          fontWeight: FontWeight.w600,
        ),
        headlineLarge: GoogleFonts.inter(
          fontSize: FontSizes.headlineLarge,
          fontWeight: FontWeight.normal,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: FontSizes.headlineMedium,
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: GoogleFonts.inter(
          fontSize: FontSizes.headlineSmall,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: FontSizes.titleLarge,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: GoogleFonts.inter(
          fontSize: FontSizes.titleMedium,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: GoogleFonts.inter(
          fontSize: FontSizes.titleSmall,
          fontWeight: FontWeight.w500,
        ),
        labelLarge: GoogleFonts.inter(
          fontSize: FontSizes.labelLarge,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: GoogleFonts.inter(
          fontSize: FontSizes.labelMedium,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: GoogleFonts.inter(
          fontSize: FontSizes.labelSmall,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: FontSizes.bodyLarge,
          fontWeight: FontWeight.normal,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: FontSizes.bodyMedium,
          fontWeight: FontWeight.normal,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: FontSizes.bodySmall,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
