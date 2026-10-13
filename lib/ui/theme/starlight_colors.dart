import 'package:flutter/material.dart';

/// Rosé color scheme - Dusty rose / rose quartz tones
///
/// Light theme uses soft light rose (#D1A3AA) surfaces with BLACK text.
/// Dark theme uses deep rose (#B07B7F) with light rose text.
class StarlightColors {
  // Light theme - Soft rose tones (text is BLACK for readability)
  static const lightPrimary = Color(0xFFD1A3AA); // Light rose (given)
  static const lightSecondary = Color(0xFFB07B7F); // Deep rose (gradient end)
  static const lightBackground = Color(0xFFF8EEEE); // Very light rose cream
  static const lightSurface = Color(0xFFF3E3E4); // Light rose surface
  static const lightCard = Color(0xFFE9CFD2); // Rose card
  static const lightTextPrimary = Color(0xFF000000); // BLACK (per request)
  static const lightTextSecondary = Color(0xFF6E3F45); // Dark rose-brown
  static const lightError = Color(0xFFC62828);
  static const lightSuccess = Color(0xFF2E7D32);
  static const lightWarning = Color(0xFFEF6C00);

  // Dark theme - Deep rose tones
  static const darkPrimary = Color(0xFFB07B7F); // Deep rose (given)
  static const darkSecondary = Color(0xFF9E6670); // Deeper rose
  static const darkBackground = Color(0xFF150E0F); // Near black with rose tint
  static const darkSurface = Color(0xFF1F1416); // Dark rose-black
  static const darkCard = Color(0xFF2A1B1E); // Dark rose card
  static const darkTextPrimary = Color(0xFFF6ECED); // Light rose-white
  static const darkTextSecondary = Color(0xFFD1A3AA); // Light rose
  static const darkError = Color(0xFFEF5350);
  static const darkSuccess = Color(0xFF66BB6A);
  static const darkWarning = Color(0xFFFFA726);

  // Rosé effect colors
  static const starlightLight1 = Color(0xFFE9CFD2);
  static const starlightLight2 = Color(0xFFD9BEC1);
  static const starlightDark1 = Color(0xFF2A1B1E);
  static const starlightDark2 = Color(0xFF40282B);

  // Semantic colors - Light theme
  static const lightBorder = Color(0xFFB07B7F);
  static const lightDivider = Color(0xFFD9BEC1);
  static const lightShadow = Color(0xFF8C5A60);
  static const lightDisabled = Color(0xFFC4AEB1);
  static const lightOnPrimary = Color(0xFF000000); // BLACK text on light rose
  static const lightOnSecondary = Color(0xFFFFFFFF); // White on deep rose
  static const lightOnBackground = Color(0xFF000000); // BLACK
  static const lightOnSurface = Color(0xFF000000); // BLACK
  static const lightOnError = Color(0xFFFFFFFF);

  // Semantic colors - Dark theme
  static const darkBorder = Color(0xFFB07B7F);
  static const darkDivider = Color(0xFF40282B);
  static const darkShadow = Color(0xFF000000);
  static const darkDisabled = Color(0xFF6B4A4E);
  static const darkOnPrimary = Color(0xFFFFFFFF);
  static const darkOnSecondary = Color(0xFFFFFFFF);
  static const darkOnBackground = Color(0xFFF6ECED);
  static const darkOnSurface = Color(0xFFF6ECED);
  static const darkOnError = Color(0xFF000000);

  // Accent colors for interactive elements
  static const accentStar = Color(0xFFB07B7F); // Deep rose star
  static const accentNebula = Color(0xFF9E6670); // Dusty rose nebula
  static const accentCosmos = Color(0xFFC98B92); // Rose cosmos
  static const accentGalaxy = Color(0xFF8E5A60); // Deep rose galaxy

  // Theme-aware accent colors
  /// Light mode accent color - Deep rose for visibility
  static const lightAccent = accentStar;

  /// Dark mode accent color - Light rose for glow effect
  static const darkAccent = accentNebula;
}
