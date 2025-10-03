import 'package:flutter/material.dart';

class ScrollFooterWidgetController {
  final ScrollController scrollController = ScrollController();
  final String message =
      '💱 Special offer: No commission on USD/EUR exchanges this week! '
      '• Visit our branch for the best rates • '
      'Follow us on social media for daily updates • ';

  late VoidCallback _onScrollComplete;
  bool _isDisposed = false;

  void init(VoidCallback onScrollComplete) {
    _onScrollComplete = onScrollComplete;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startScrolling();
    });
  }

  void _startScrolling() {
    if (_isDisposed || !scrollController.hasClients) return;

    final maxScroll = scrollController.position.maxScrollExtent;

    scrollController
        .animateTo(
          maxScroll,
          duration: Duration(seconds: (maxScroll / 30).round()),
          curve: Curves.linear,
        )
        .then((_) {
          if (_isDisposed) return;

          scrollController.jumpTo(0);
          _startScrolling();
        });
  }

  void dispose() {
    _isDisposed = true;
    scrollController.dispose();
  }
}
