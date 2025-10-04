import 'package:flutter/material.dart';
import 'package:advertisment_screen/advertise/currencybill_board_widgets/flipping_card_animation_widget.dart';

class CurrencyBillBoardController {
  final List<GlobalKey<FlipCardAnimationWidgetState>> flipCardKeys = [];
  bool _isAnimating = false;

  void initialize(int length) {
    flipCardKeys.clear();
    flipCardKeys.addAll(
      List.generate(
        length,
        (index) => GlobalKey<FlipCardAnimationWidgetState>(),
      ),
    );
  }

  void startAnimation() {
    _isAnimating = true;
    _flipCardsSequentially();
  }

  void stopAnimation() {
    _isAnimating = false;
  }

  Future<void> _flipCardsSequentially() async {
    if (!_isAnimating) return;

    // Flip front to back
    for (int i = 0; i < flipCardKeys.length; i++) {
      await Future.delayed(const Duration(milliseconds: 400));
      if (!_isAnimating) return;
      flipCardKeys[i].currentState?.flip();
    }

    await Future.delayed(const Duration(seconds: 3));
    if (!_isAnimating) return;

    // Flip back to front
    for (int i = 0; i < flipCardKeys.length; i++) {
      await Future.delayed(const Duration(milliseconds: 400));
      if (!_isAnimating) return;
      flipCardKeys[i].currentState?.flip();
    }

    await Future.delayed(const Duration(seconds: 10));
    if (_isAnimating) {
      _flipCardsSequentially(); // Continue looping
    }
  }

  void flipAllCards() {
    for (final key in flipCardKeys) {
      key.currentState?.flip();
    }
  }

  void flipCardAtIndex(int index) {
    if (index >= 0 && index < flipCardKeys.length) {
      flipCardKeys[index].currentState?.flip();
    }
  }

  void dispose() {
    stopAnimation();
    flipCardKeys.clear();
  }
}
