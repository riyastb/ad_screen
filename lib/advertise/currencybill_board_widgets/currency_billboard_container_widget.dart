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

  const CurrenceyBillBoardContainerWidget(
      {super.key, this.controller, this.branches, required this.theme});

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
      final visibleCards = isLandscape ? 8 : 12;
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
    final visibleCards = isLandscape ? 8 : 9;
    
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
      width: responsive.isLandscape
          ? responsive.getWidth(0.68)
          : responsive.width,
      height: responsive.getHeight(0.5),
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
                        return Expanded(
                          child: FlipCardAnimationWidget(
                            key: _controller.flipCardKeys[index],
                            front: CurrencyBillboardTileWidget(
                              flag: getFlagFromCurrency(branch.currencyCode ?? ''),
                              currencyCode: branch.currencyCode,
                              buyRate: branch.forexBuyRate,
                              sellRate: branch.forexSellRate,
                              remittanceRate: branch.remittanceRate,
                              baseCurrencyCode: 'AED',
                              theme: widget.theme,
                            ),
                            back: CurrencyBillboardTileWidget(
                              flag: getFlagFromCurrency(branch.currencyCode ?? ''),
                              currencyCode: branch.currencyCode,
                              buyRate: branch.forexBuyRate,
                              sellRate: branch.forexSellRate,
                              remittanceRate: branch.remittanceRate,
                              baseCurrencyCode: 'AED',
                              theme: widget.theme,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
  String getFlagFromCurrency(String code) {
    return currencyFlagMap[code.toUpperCase()] ?? "🏳️"; // default white flag if not found
  }
   Map<String, String> currencyFlagMap = {
    "USD": "🇺🇸",
    "EUR": "🇪🇺",
    "GBP": "🇬🇧",
    "JPY": "🇯🇵",
    "AED": "🇦🇪",
    "SAR": "🇸🇦",
    "INR": "🇮🇳",
    "CNY": "🇨🇳",
    "AUD": "🇦🇺",
    "CAD": "🇨🇦",
    "CHF": "🇨🇭",
    "KWD": "🇰🇼",
    "QAR": "🇶🇦",
    "BHD": "🇧🇭",
    "OMR": "🇴🇲",
    "SGD": "🇸🇬",
    "MYR": "🇲🇾",
    "PKR": "🇵🇰",
    "BDT": "🇧🇩",
    "ZAR": "🇿🇦",
    "NGN": "🇳🇬",
    "EGP": "🇪🇬",
    "TRY": "🇹🇷",
    "RUB": "🇷🇺",
    "BRL": "🇧🇷",
    "MXN": "🇲🇽",
    "THB": "🇹🇭",
    "KRW": "🇰🇷",
    "HKD": "🇭🇰",
    "ILS": "🇮🇱",
    "NOK": "🇳🇴",
    "SEK": "🇸🇪",
    "DKK": "🇩🇰",
    "PLN": "🇵🇱",
    "CZK": "🇨🇿",
    "RON": "🇷🇴",
    "KES": "🇰🇪",
    "ETB": "🇪🇹",
  };

}
