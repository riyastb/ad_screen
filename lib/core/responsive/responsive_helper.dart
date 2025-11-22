import 'package:flutter/material.dart';

/// Responsive helper class for consistent sizing across different screen sizes
class ResponsiveHelper {
  final BuildContext context;
  final MediaQueryData mediaQuery;
  
  /// Size multiplier to increase all sizes by 40%
  static const double sizeMultiplier = 1.4;

  ResponsiveHelper(this.context) : mediaQuery = MediaQuery.of(context);

  /// Get screen width
  double get width => mediaQuery.size.width;

  /// Get screen height
  double get height => mediaQuery.size.height;

  /// Get screen orientation
  Orientation get orientation => mediaQuery.orientation;

  /// Check if landscape
  bool get isLandscape => orientation == Orientation.landscape;

  /// Check if portrait
  bool get isPortrait => orientation == Orientation.portrait;

  /// Get responsive font size based on screen width
  /// Uses a base size that scales with screen width
  /// All sizes are increased by 40%
  /// For portrait mode (1080x1920), uses 1080 as reference width
  double getFontSize(double baseSize) {
    // Use reference width based on orientation
    // Portrait (1080x1920): use 1080 as reference
    // Landscape: use 1920 as reference
    final referenceWidth = isPortrait ? 1080.0 : 1920.0;
    final scaleFactor = width / referenceWidth;
    
    // Clamp between 0.5 and 2.0 to prevent extreme scaling
    final clampedScale = scaleFactor.clamp(0.5, 2.0);
    
    return baseSize * clampedScale * sizeMultiplier;
  }

  /// Get responsive icon size based on screen width
  double getIconSize(double baseSize) {
    return getFontSize(baseSize);
  }

  /// Get responsive padding based on screen width
  /// All sizes are increased by 40%
  /// For portrait mode (1080x1920), uses 1080 as reference width
  double getPadding(double basePadding) {
    final referenceWidth = isPortrait ? 1080.0 : 1920.0;
    final scaleFactor = width / referenceWidth;
    final clampedScale = scaleFactor.clamp(0.5, 2.0);
    return basePadding * clampedScale * sizeMultiplier;
  }

  /// Get responsive margin based on screen width
  double getMargin(double baseMargin) {
    return getPadding(baseMargin);
  }

  /// Get responsive height based on screen height
  double getHeight(double percentage) {
    return height * percentage;
  }

  /// Get responsive width based on screen width
  double getWidth(double percentage) {
    return width * percentage;
  }

  /// Get responsive border radius
  double getBorderRadius(double baseRadius) {
    return getPadding(baseRadius);
  }

  /// Get responsive spacing (SizedBox height/width)
  double getSpacing(double baseSpacing) {
    return getPadding(baseSpacing);
  }
}

/// Extension on BuildContext for easy access to ResponsiveHelper
extension ResponsiveExtension on BuildContext {
  ResponsiveHelper get responsive => ResponsiveHelper(this);
}

