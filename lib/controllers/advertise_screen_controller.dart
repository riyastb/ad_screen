import 'package:flutter/material.dart';
import 'package:advertisment_screen/advertise/currencybill_board_widgets/flipping_card_animation_widget.dart';

class CurrencyBillBoardController {
  final List<GlobalKey<FlipCardAnimationWidgetState>> flipCardKeys = [];
  bool _isAnimating = false;
  int _totalItems = 0;
  static const int visibleCards = 8;
  
  // Track current data indices for each visible card
  List<int> _currentDataIndices = [];
  
  // Callback to notify when data changes
  Function()? onDataChanged;

  void initialize(int length) {
    _totalItems = length;
    _initializeDataIndices();
    _updateFlipCardKeys();
  }

  void _initializeDataIndices() {
    _currentDataIndices.clear();
    // Initialize with first 8 items (or available items if less than 8)
    final itemCount = _totalItems < visibleCards ? _totalItems : visibleCards;
    _currentDataIndices = List.generate(itemCount, (index) => index);
  }

  void _updateFlipCardKeys() {
    flipCardKeys.clear();
    flipCardKeys.addAll(
      List.generate(
        _currentDataIndices.length,
        (index) => GlobalKey<FlipCardAnimationWidgetState>(),
      ),
    );
  }

  List<int> get currentDataIndices => List.from(_currentDataIndices);
  int get visibleCardCount => _currentDataIndices.length;

  void startAnimation() {
    _isAnimating = true;
    _flipCardsSequentially();
  }

  void stopAnimation() {
    _isAnimating = false;
  }

  Future<void> _flipCardsSequentially() async {
    if (!_isAnimating || _totalItems == 0) return;

    // Flip cards one by one (front to back) and change data
    for (int i = 0; i < _currentDataIndices.length; i++) {
      await Future.delayed(const Duration(milliseconds: 400));
      if (!_isAnimating) return;
      
      // Change data for this card before flipping
      _rotateDataForCard(i);
      onDataChanged?.call();
      
      // Then flip the card
      flipCardKeys[i].currentState?.flip();
    }

    await Future.delayed(const Duration(seconds: 8));
    if (!_isAnimating) return;

    // Flip cards back (back to front) and change data again
    for (int i = 0; i < _currentDataIndices.length; i++) {
      await Future.delayed(const Duration(milliseconds: 400));
      if (!_isAnimating) return;
      
      // Change data for this card before flipping back
      _rotateDataForCard(i);
      onDataChanged?.call();
      
      // Then flip the card back
      flipCardKeys[i].currentState?.flip();
    }

    await Future.delayed(const Duration(seconds: 8));
    if (_isAnimating) {
      _flipCardsSequentially(); // Continue looping
    }
  }

  void _rotateDataForCard(int cardIndex) {
    if (cardIndex < _currentDataIndices.length) {
      // Move to next data item, wrapping around if necessary
      _currentDataIndices[cardIndex] = (_currentDataIndices[cardIndex] + visibleCards) % _totalItems;
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
    _currentDataIndices.clear();
  }
}
