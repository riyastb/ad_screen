import 'package:advertisment_screen/advertise/currencybill_board_widgets/currency_billboard_tile_widget.dart';
import 'package:advertisment_screen/advertise/currencybill_board_widgets/flipping_card_animation_widget.dart';
import 'package:advertisment_screen/controllers/advertise_screen_controller.dart';
import 'package:advertisment_screen/domain/branch/branch.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:advertisment_screen/core/responsive/responsive_helper.dart';
import 'package:advertisment_screen/advertise/models/branch_theme.dart';

class CurrenceyBillBoardContainerWidget extends StatefulWidget {
  final CurrencyBillBoardController? controller;
  final List<Branch>? branches;
  final BranchTheme theme;
  final double? tileHeight;

  const CurrenceyBillBoardContainerWidget({
    super.key,
    this.controller,
    this.branches,
    required this.theme,
    this.tileHeight,
  });

  @override
  State<CurrenceyBillBoardContainerWidget> createState() =>
      _CurrenceyBillBoardContainerWidgetState();
}

class _CurrenceyBillBoardContainerWidgetState
    extends State<CurrenceyBillBoardContainerWidget> {
  late CurrencyBillBoardController _controller;
  bool? _lastOrientation;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();

    // Use provided controller or create a new one
    _controller = widget.controller ?? CurrencyBillBoardController();
    _controller.onDataChanged = () {
      setState(() {
        // Rebuild when data changes
      });
    };
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      final effectiveLength = widget.branches?.length ?? 0;
      final responsive = context.responsive;
      final isLandscape = responsive.isLandscape;
      _lastOrientation = isLandscape;
      final visibleCards = isLandscape ? 8 : 10;
      _controller.initialize(effectiveLength, visibleCards: visibleCards);
      _isInitialized = true;

      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          _controller.startAnimation();
        }
      });
    }
  }

  @override
  void didUpdateWidget(covariant CurrenceyBillBoardContainerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldLen = oldWidget.branches?.length ?? 0;
    final newLen = widget.branches?.length ?? 0;
    final responsive = context.responsive;
    final isLandscape = responsive.isLandscape;
    // Portrait mode (1080x1920): show 12 cards, Landscape: show 8 cards
    final visibleCards = isLandscape ? 8 : 10;

    // Reinitialize if branch count changed or orientation changed
    if (newLen != oldLen || _lastOrientation != isLandscape) {
      _lastOrientation = isLandscape;
      _controller.initialize(newLen, visibleCards: visibleCards);
      // Optionally restart the animation to reflect new items
      Future.microtask(() {
        if (mounted) {
          _controller.startAnimation();
        }
      });
    }
  }

  @override
  void dispose() {
    // Only dispose if we created the controller internally
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  List<Branch> _getCurrentVisibleBranches() {
    final items = widget.branches ?? const <Branch>[];
    if (items.isEmpty || !_isInitialized) return [];

    final dataIndices = _controller.currentDataIndices;
    if (dataIndices.isEmpty) return [];

    return dataIndices
        .where((index) => index >= 0 && index < items.length)
        .map((index) => items[index])
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    final currentBranches = _getCurrentVisibleBranches();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(responsive.getBorderRadius(13)),
      ),
      width: responsive.isLandscape ? responsive.width : responsive.width,
      height: responsive.isLandscape
          ? responsive.getHeight(0.7)
          : responsive.getHeight(0.53),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Optional: Show current data range
          // if (widget.branches != null && widget.branches!.length > 8)
          //   Padding(
          //     padding: EdgeInsets.all(responsive.getPadding(8.0)),
          //     child: Text(
          //       'Showing ${currentBranches.length} of ${widget.branches!.length} currencies',
          //       style: TextStyle(
          //         fontSize: responsive.getFontSize(12),
          //         color: Colors.grey,
          //       ),
          //     ),
          //   ),
          // Cards container
          Expanded(
            child: currentBranches.isEmpty
                ? const SizedBox.shrink()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      currentBranches.length,
                      (index) {
                        if (index >= currentBranches.length ||
                            index >= _controller.flipCardKeys.length) {
                          return const SizedBox.shrink();
                        }
                        final branch = currentBranches[index];
                        // Use branch.countryCode if valid (not empty and not "UN"), otherwise map from currency code
                        final rawCountryCode =
                            branch.countryCode?.toUpperCase().trim();
                        final countryCode = (rawCountryCode != null &&
                                rawCountryCode.isNotEmpty &&
                                rawCountryCode != 'UN')
                            ? rawCountryCode
                            : getCountryCodeFromCurrency(
                                branch.currencyCode ?? '');
                        final tileWidget = FlipCardAnimationWidget(
                          key: _controller.flipCardKeys[index],
                          front: CurrencyBillboardTileWidget(
                            countryCode: countryCode,
                            currencyCode: branch.currencyCode,
                            buyRate: branch.forexBuyRate,
                            sellRate: branch.forexSellRate,
                            remittanceRate: branch.remittanceRate,
                            baseCurrencyCode: 'AED',
                            theme: widget.theme,
                            height: widget.tileHeight,
                          ),
                          back: CurrencyBillboardTileWidget(
                            countryCode: countryCode,
                            currencyCode: branch.currencyCode,
                            buyRate: branch.forexBuyRate,
                            sellRate: branch.forexSellRate,
                            remittanceRate: branch.remittanceRate,
                            baseCurrencyCode: 'AED',
                            theme: widget.theme,
                            height: widget.tileHeight,
                          ),
                        );
                        return widget.tileHeight != null
                            ? SizedBox(
                                height: widget.tileHeight,
                                child: tileWidget,
                              )
                            : Expanded(child: tileWidget);
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  String? getCountryCodeFromCurrency(String code) {
    return currencyToCountryCodeMap[code.toUpperCase()];
  }

  // Map currency codes to ISO 3166-1 alpha-2 country codes
  Map<String, String> currencyToCountryCodeMap = {
    // Major currencies
    "USD": "US",
    "EUR": "DE", // European Union (using Germany as representative)
    "GBP": "GB",
    "JPY": "JP",
    "CNY": "CN",
    "AUD": "AU",
    "CAD": "CA",
    "CHF": "CH",
    "NZD": "NZ",
    "SGD": "SG",
    "HKD": "HK",

    // Middle East
    "AED": "AE",
    "SAR": "SA",
    "KWD": "KW",
    "QAR": "QA",
    "BHD": "BH",
    "OMR": "OM",
    "JOD": "JO",
    "LBP": "LB",
    "ILS": "IL",
    "IRR": "IR",
    "IQD": "IQ",
    "YER": "YE",

    // South Asia
    "INR": "IN",
    "PKR": "PK",
    "BDT": "BD",
    "LKR": "LK",
    "NPR": "NP",
    "AFN": "AF",

    // Southeast Asia
    "MYR": "MY",
    "THB": "TH",
    "IDR": "ID",
    "PHP": "PH",
    "VND": "VN",
    "MMK": "MM",
    "KHR": "KH",
    "LAK": "LA",

    // East Asia
    "KRW": "KR",
    "TWD": "TW",
    "MOP": "MO",

    // Africa
    "ZAR": "ZA",
    "NGN": "NG",
    "EGP": "EG",
    "KES": "KE",
    "ETB": "ET",
    "GHS": "GH",
    "UGX": "UG",
    "TZS": "TZ",
    "MAD": "MA",
    "DZD": "DZ",
    "TND": "TN",
    "XOF": "SN", // West African CFA franc (Senegal as representative)
    "XAF": "CM", // Central African CFA franc (Cameroon as representative)

    // Europe
    "NOK": "NO",
    "SEK": "SE",
    "DKK": "DK",
    "PLN": "PL",
    "CZK": "CZ",
    "RON": "RO",
    "HUF": "HU",
    "BGN": "BG",
    "HRK": "HR",
    "RSD": "RS",
    "BAM": "BA",
    "MKD": "MK",
    "ALL": "AL",
    "ISK": "IS",
    "UAH": "UA",
    "BYN": "BY",
    "MDL": "MD",
    "GEL": "GE",
    "AMD": "AM",
    "AZN": "AZ",

    // Americas
    "BRL": "BR",
    "MXN": "MX",
    "ARS": "AR",
    "CLP": "CL",
    "COP": "CO",
    "PEN": "PE",
    "UYU": "UY",
    "PYG": "PY",
    "BOB": "BO",
    "VES": "VE",
    "GTQ": "GT",
    "HNL": "HN",
    "NIO": "NI",
    "CRC": "CR",
    "PAB": "PA",
    "DOP": "DO",
    "JMD": "JM",
    "TTD": "TT",
    "BBD": "BB",
    "BZD": "BZ",
    "XCD":
        "AG", // East Caribbean dollar (Antigua and Barbuda as representative)
    "STD": "ST", // São Tomé and Príncipe (São Tomé and Príncipe dobra)

    // Other
    "TRY": "TR",
    "RUB": "RU",
    "KZT": "KZ",
    "UZS": "UZ",
    "KGS": "KG",
    "TJS": "TJ",
    "TMT": "TM",
    "MNT": "MN",

    // Special codes that might come from backend
    "101": "IN", // Indian Rupee (alternative code)
    "RS2": "IN", // Rupees (alternative code)
  };
}
