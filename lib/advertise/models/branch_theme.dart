import 'package:flutter/material.dart';

import 'package:advertisment_screen/advertise/utils/color_parser.dart';
import 'package:advertisment_screen/domain/branch/model/branch.dart';

/// Convenience model that converts backend theme hex values into [Color]s.
class BranchTheme {
  final Color? bodyBackground;
  final List<Color>? bodyBackgroundGradient;
  final Color? headerBackground;
  final List<Color>? headerBackgroundGradient;
  final Color? branchNameTextColor;
  final Color? transferRateTextColor;
  final Color? buyRateTextColor;
  final Color? sellRateTextColor;
  final Color? footerBackground;
  final List<Color>? footerBackgroundGradient;
  final Color? footerTextColor;
  final Color? rateCardBackground;
  final List<Color>? rateCardBackgroundGradient;
  final Color? currencyTextColor;
  final Color? clockTextColor;
  final Color? calendarTextColor;

  const BranchTheme({
    this.bodyBackground,
    this.bodyBackgroundGradient,
    this.headerBackground,
    this.headerBackgroundGradient,
    this.branchNameTextColor,
    this.transferRateTextColor,
    this.buyRateTextColor,
    this.sellRateTextColor,
    this.footerBackground,
    this.footerBackgroundGradient,
    this.footerTextColor,
    this.rateCardBackground,
    this.rateCardBackgroundGradient,
    this.currencyTextColor,
    this.clockTextColor,
    this.calendarTextColor,
  });

  /// Builds a theme from the first branch result. When no colors are provided
  /// the fields remain `null` so that widgets can fall back to defaults.
  factory BranchTheme.fromBranch(
    Branch? branch, {
    bool useRemoteTheme = true,
  }) {
    if (!useRemoteTheme || branch == null) {
      return const BranchTheme();
    }

    // Parse gradients for background colors
    final bodyBgGradient = colorsFromHexGradient(branch.bbColor);
    final headerBgGradient = colorsFromHexGradient(branch.headerBBColor);
    final footerBgGradient = colorsFromHexGradient(branch.footerBgColor);
    final rateCardBgGradient = colorsFromHexGradient(branch.rateCardBgColor);

    return BranchTheme(
      bodyBackground: bodyBgGradient.length == 1 ? bodyBgGradient.first : null,
      bodyBackgroundGradient: bodyBgGradient.length > 1 ? bodyBgGradient : null,
      headerBackground: headerBgGradient.length == 1 ? headerBgGradient.first : null,
      headerBackgroundGradient: headerBgGradient.length > 1 ? headerBgGradient : null,
      branchNameTextColor: colorFromHex(branch.branchNameTextColor),
      transferRateTextColor: colorFromHex(branch.transferRateTextColor),
      buyRateTextColor: colorFromHex(branch.buyRateTextColor),
      sellRateTextColor: colorFromHex(branch.sellRateTextColor),
      footerBackground: footerBgGradient.length == 1 ? footerBgGradient.first : null,
      footerBackgroundGradient: footerBgGradient.length > 1 ? footerBgGradient : null,
      footerTextColor: colorFromHex(branch.footerTextColor),
      rateCardBackground: rateCardBgGradient.length == 1 ? rateCardBgGradient.first : null,
      rateCardBackgroundGradient: rateCardBgGradient.length > 1 ? rateCardBgGradient : null,
      currencyTextColor: colorFromHex(branch.currencyTextColor),
      clockTextColor: colorFromHex(branch.clockTextColor),
      calendarTextColor: colorFromHex(branch.calenderTextColor),
    );
  }
}

