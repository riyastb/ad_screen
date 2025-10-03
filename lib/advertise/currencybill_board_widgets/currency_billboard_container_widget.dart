import 'package:advertisment_screen/advertise/currencybill_board_widgets/currency_billboard_tile_widget.dart';
import 'package:advertisment_screen/advertise/currencybill_board_widgets/flipping_card_animation_widget.dart';
import 'package:advertisment_screen/controllers/advertise_screen_controller.dart';
import 'package:advertisment_screen/domain/branch/branch.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class CurrenceyBillBoardContainerWidget extends StatefulWidget {
  final CurrencyBillBoardController? controller;
  final List<Branch>? branches;

  const CurrenceyBillBoardContainerWidget({super.key, this.controller, this.branches});

  @override
  State<CurrenceyBillBoardContainerWidget> createState() =>
      _CurrenceyBillBoardContainerWidgetState();
}

class _CurrenceyBillBoardContainerWidgetState
    extends State<CurrenceyBillBoardContainerWidget> {
  late CurrencyBillBoardController _controller;
  

  @override
  void initState() {
    super.initState();

    // Use provided controller or create a new one
    _controller = widget.controller ?? CurrencyBillBoardController();
    final effectiveLength = widget.branches?.length ?? 0;
    _controller.initialize(effectiveLength);

    Future.delayed(const Duration(seconds: 1), () {
      _controller.startAnimation();
    });
  }

  @override
  void didUpdateWidget(covariant CurrenceyBillBoardContainerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldLen = oldWidget.branches?.length ?? 0;
    final newLen = widget.branches?.length ?? 0;
    if (newLen != oldLen) {
      _controller.initialize(newLen);
      // Optionally restart the animation to reflect new items
      Future.microtask(() => _controller.startAnimation());
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

  @override
  Widget build(BuildContext context) {
    final items = widget.branches ?? const <Branch>[];
    print('------------------$items--------------------1---------------');
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(13)),
      width: MediaQuery.of(context).size.width * 0.68,
      height: MediaQuery.of(context).size.height * 0.74,
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(items.length, (index) {
              final branch = items[index];
              return FlipCardAnimationWidget(
                key: _controller.flipCardKeys[index],
                front: CurrencyBillboardTileWidget(
                  currencyCode: branch.currencyCode?.isNotEmpty == true ? branch.currencyCode : branch.currencyName,
                  buyRate: branch.forexBuyRate,
                  sellRate: branch.forexSellRate,
                  remittanceRate: branch.remittanceRate,
                  baseCurrencyCode: 'AED',
                ),
                back: CurrencyBillboardTileWidget(
                  currencyCode: branch.currencyCode?.isNotEmpty == true ? branch.currencyCode : branch.currencyName,
                  buyRate: branch.forexBuyRate,
                  sellRate: branch.forexSellRate,
                  remittanceRate: branch.remittanceRate,
                  baseCurrencyCode: 'AED',
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
