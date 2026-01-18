import 'package:flutter/material.dart';

class AppTheme {
  // ============================================================================
  // PRIMARY COLORS - Modern, vibrant, accessible
  // ============================================================================
  static const Color primaryBlue = Color(0xFF2196F3);      // Deeper blue (better contrast)
  static const Color primaryBlueDark = Color(0xFF1976D2);  // For depth/hover
  static const Color primaryBlueLight = Color(0xFF64B5F6); // For highlights
  
  static const Color secondaryOrange = Color(0xFFFF9800);  // Warm, energetic (replaces yellow)
  static const Color secondaryOrangeDark = Color(0xFFF57C00);
  static const Color secondaryOrangeLight = Color(0xFFFFB74D);
  
  // ============================================================================
  // ACCENT COLORS - Category-specific, high contrast
  // ============================================================================
  static const Color accentGreen = Color(0xFF4CAF50);      // Success/Nature
  static const Color accentGreenLight = Color(0xFF81C784);
  
  static const Color accentPink = Color(0xFFE91E63);       // Playful/Fun
  static const Color accentPinkLight = Color(0xFFF48FB1);
  
  static const Color accentPurple = Color(0xFF9C27B0);     // Challenge/Mystery
  static const Color accentPurpleLight = Color(0xFFBA68C8);
  
  static const Color accentTeal = Color(0xFF00BCD4);       // Fresh/Cool
  static const Color accentTealLight = Color(0xFF4DD0E1);
  
  // ============================================================================
  // NEUTRAL PALETTE - Text hierarchy and backgrounds
  // ============================================================================
  static const Color neutral50 = Color(0xFFFAFAFA);   // Lightest background
  static const Color neutral100 = Color(0xFFF5F5F5);  // Card backgrounds
  static const Color neutral200 = Color(0xFFEEEEEE);  // Borders/dividers
  static const Color neutral300 = Color(0xFFE0E0E0);  // Disabled states
  static const Color neutral700 = Color(0xFF616161);  // Secondary text
  static const Color neutral800 = Color(0xFF424242);  // Primary text
  static const Color neutral900 = Color(0xFF212121);  // Headings
  
  // ============================================================================
  // SEMANTIC COLORS - Functional states
  // ============================================================================
  static const Color successGreen = Color(0xFF4CAF50);
  static const Color successGreenLight = Color(0xFF81C784);
  
  static const Color errorRed = Color(0xFFF44336);
  static const Color errorRedLight = Color(0xFFE57373);
  
  static const Color warningAmber = Color(0xFFFFC107);
  static const Color warningAmberLight = Color(0xFFFFD54F);
  
  static const Color infoBlue = Color(0xFF2196F3);
  
  // ============================================================================
  // BACKGROUND SYSTEM
  // ============================================================================
  static const Color bgPrimary = Color(0xFFFAFAFA);
  static const Color bgSecondary = Color(0xFFFFFFFF);
  
  // Background tones (legacy support)
  static const Color bgBlue = Color(0xFFE3F2FD);
  static const Color bgYellow = Color(0xFFFFF3E0);
  
  // Text colors (updated for better hierarchy)
  static const Color darkText = neutral800;
  static const Color mediumText = neutral700;
  static const Color heavyText = neutral900;

  // ============================================================================
  // GRADIENTS - Modern, dynamic backgrounds
  // ============================================================================
  static const LinearGradient mainBackgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFE3F2FD), // Soft blue
      Color(0xFFFCE4EC), // Soft pink
      Color(0xFFFFF9C4), // Soft yellow
    ],
    stops: [0.0, 0.5, 1.0],
  );

  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF2196F3),
      Color(0xFF1976D2),
    ],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFFF8F9FA),
    ],
  );

  // Shadows
  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: const Color(0xFF37474F).withValues(alpha: 0.08),
      blurRadius: 16,
      offset: const Offset(0, 8),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: const Color(0xFF37474F).withValues(alpha: 0.05),
      blurRadius: 4,
      offset: const Offset(0, 2),
      spreadRadius: 0,
    ),
  ];
  
  static List<BoxShadow> glowShadow(Color color) => [
    BoxShadow(
      color: color.withValues(alpha: 0.4),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];

  // Decorations
  static BoxDecoration glassDecoration = BoxDecoration(
    color: Colors.white.withValues(alpha: 0.7),
    borderRadius: BorderRadius.circular(24),
    border: Border.all(
      color: Colors.white.withValues(alpha: 0.8), 
      width: 1.5
    ),
    boxShadow: cardShadow,
  );

  static BoxDecoration vibrantCardDecoration(Color color) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(24),
      boxShadow: [
        BoxShadow(
          color: color.withValues(alpha: 0.4),
          blurRadius: 12,
          offset: const Offset(0, 6),
        ),
      ],
    );
  }

  // Button Style
  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: secondaryOrange,
    foregroundColor: Colors.white,
    elevation: 4,
    shadowColor: secondaryOrange.withValues(alpha: 0.5),
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    textStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: 'Nunito',
    ),
  );

  // Text Styles
  static const TextStyle headingStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w800,
    color: heavyText,
    fontFamily: 'Nunito',
    letterSpacing: -0.5,
  );
  
  static const TextStyle titleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: darkText,
    fontFamily: 'Nunito',
  );
  
  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: mediumText,
    fontFamily: 'Nunito',
  );

  static const TextStyle bodyStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: mediumText,
    fontFamily: 'Nunito',
  );
  
  static const TextStyle wordStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w800,
    color: heavyText,
    fontFamily: 'Nunito',
    letterSpacing: 1.0,
  );

  // ============================================================================
  // COMPATIBILITY ALIASES - For smooth transition from old color names
  // ============================================================================
  static const Color lightBlue = primaryBlue;
  static const Color secondaryYellow = secondaryOrange; // Maps to new orange
  static const Color softYellow = secondaryOrangeLight;
  static const Color mintGreen = accentGreen;
  static const Color lavender = accentPurple;
  static const Color lightText = mediumText;
  static const Color warningOrange = warningAmber;
  static const Color accentOrange = secondaryOrange;
  
  static ButtonStyle get primaryButton => primaryButtonStyle;

  // Helper for context-aware opacity (deprecated replacer)
  static Color opacity(Color color, double value) => color.withValues(alpha: value);
}
