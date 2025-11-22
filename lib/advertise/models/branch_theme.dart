import 'package:flutter/material.dart';

import 'package:advertisment_screen/advertise/utils/color_parser.dart';
import 'package:advertisment_screen/domain/branch/model/branch.dart';

/// Convenience model that converts backend theme hex values into [Color]s.
class BranchTheme {
  final Color? bodyBackground;
  final Color? headerBackground;
  final Color? branchNameTextColor;
  final Color? transferRateTextColor;
  final Color? buyRateTextColor;
  final Color? sellRateTextColor;
  final Color? footerBackground;
  final Color? footerTextColor;
  final Color? rateCardBackground;
  final Color? currencyTextColor;
  final Color? clockTextColor;
  final Color? calendarTextColor;

  const BranchTheme({
    this.bodyBackground,
    this.headerBackground,
    this.branchNameTextColor,
    this.transferRateTextColor,
    this.buyRateTextColor,
    this.sellRateTextColor,
    this.footerBackground,
    this.footerTextColor,
    this.rateCardBackground,
    this.currencyTextColor,
    this.clockTextColor,
    this.calendarTextColor,
  });

  /// Builds a theme from the first branch result. When no colors are provided
  /// the fields remain `null` so that widgets can fall back to defaults.
  factory BranchTheme.fromBranch(
    Branch? branch, {
    bool useRemoteTheme = false,
  }) {
    if (!useRemoteTheme || branch == null) {
      return const BranchTheme();
    }

    return BranchTheme(
      bodyBackground: colorFromHex(branch.bbColor),
      headerBackground: colorFromHex(branch.headerBBColor),
      branchNameTextColor: colorFromHex(branch.branchNameTextColor),
      transferRateTextColor: colorFromHex(branch.transferRateTextColor),
      buyRateTextColor: colorFromHex(branch.buyRateTextColor),
      sellRateTextColor: colorFromHex(branch.sellRateTextColor),
      footerBackground: colorFromHex(branch.footerBgColor),
      footerTextColor: colorFromHex(branch.footerTextColor),
      rateCardBackground: colorFromHex(branch.rateCardBgColor),
      currencyTextColor: colorFromHex(branch.currencyTextColor),
      clockTextColor: colorFromHex(branch.clockTextColor),
      calendarTextColor: colorFromHex(branch.calenderTextColor),
    );
  }
}

