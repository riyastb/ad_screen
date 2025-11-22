import 'package:flutter/material.dart';

/// Attempts to convert a hex color string from the backend into a [Color].
/// Supports the following formats:
/// - `AARRGGBB`
/// - `RRGGBB` (automatically adds opaque alpha)
/// - `#RRGGBB`, `#AARRGGBB`
/// - `0xAARRGGBB`
/// Returns `null` when the input is invalid or empty.
Color? colorFromHex(String? hex) {
  if (hex == null) return null;
  var value = hex.trim();
  if (value.isEmpty) return null;

  value = value.replaceAll('#', '');
  if (value.toLowerCase().startsWith('0x')) {
    value = value.substring(2);
  }

  // Expand shorthand like FFF to FFFFFF.
  if (value.length == 3) {
    value = value.split('').map((char) => '$char$char').join();
  }

  if (value.length == 6) {
    value = 'FF$value'; // Assume fully opaque when alpha missing.
  }

  if (value.length != 8) return null;

  final parsed = int.tryParse(value, radix: 16);
  if (parsed == null) return null;

  return Color(parsed);
}

/// Returns either the parsed color or the provided [fallback].
Color colorOrDefault(String? hex, Color fallback) {
  return colorFromHex(hex) ?? fallback;
}

