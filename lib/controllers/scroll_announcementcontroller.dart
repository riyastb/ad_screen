import 'package:flutter/material.dart';
import 'dart:async';

class ScrollFooterWidgetController {
  final ScrollController scrollController = ScrollController();
  final String message =
      '💱 Special offer: No commission on USD/EUR exchanges this week! '
      '• Visit our branch for the best rates • '
      'Follow us on social media for daily updates • ';

  late VoidCallback _onScrollComplete;
  bool _isDisposed = false;
  Timer? _retryTimer;
  bool _isScrolling = false;

  void init(VoidCallback onScrollComplete) {
    _onScrollComplete = onScrollComplete;

    // Wait for the scroll controller to be attached
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _waitForScrollController();
    });
  }

  void restart() {
    if (!_isDisposed && scrollController.hasClients) {
      scrollController.jumpTo(0);
      _isScrolling = false;
      _waitForScrollController();
    }
  }

  void _waitForScrollController() {
    if (_isDisposed) return;

    if (scrollController.hasClients && scrollController.position.maxScrollExtent > 0) {
      _startScrolling();
    } else {
      // Retry after a short delay if controller is not ready
      _retryTimer?.cancel();
      _retryTimer = Timer(const Duration(milliseconds: 100), () {
        if (!_isDisposed) {
          _waitForScrollController();
        }
      });
    }
  }

  void _startScrolling() {
    if (_isDisposed || _isScrolling) return;
    if (!scrollController.hasClients) {
      _waitForScrollController();
      return;
    }

    final maxScroll = scrollController.position.maxScrollExtent;
    if (maxScroll <= 0) {
      // No content to scroll, retry later
      _retryTimer?.cancel();
      _retryTimer = Timer(const Duration(milliseconds: 200), () {
        if (!_isDisposed) {
          _waitForScrollController();
        }
      });
      return;
    }

    _isScrolling = true;
    // Calculate duration: scroll at constant speed regardless of text length
    // Speed = distance / time, so time = distance / speed
    // Convert to milliseconds: (maxScroll / speed) * 1000
    const scrollSpeedPixelsPerSecond = 40.0;
    final durationMs = ((maxScroll / scrollSpeedPixelsPerSecond) * 1000).round();
    scrollController
        .animateTo(
          maxScroll,
          duration: Duration(milliseconds: durationMs),
          curve: Curves.linear,
        )
        .then((_) {
          if (_isDisposed) {
            _isScrolling = false;
            return;
          }

          scrollController.jumpTo(0);
          _isScrolling = false;
          
          // Small delay before restarting
          Future.delayed(const Duration(milliseconds: 500), () {
            if (!_isDisposed) {
              _startScrolling();
            }
          });
        })
        .catchError((error) {
          _isScrolling = false;
          // Retry on error
          if (!_isDisposed) {
            Future.delayed(const Duration(milliseconds: 500), () {
              if (!_isDisposed) {
                _waitForScrollController();
              }
            });
          }
        });
  }

  void dispose() {
    _isDisposed = true;
    _isScrolling = false;
    _retryTimer?.cancel();
    scrollController.dispose();
  }
}
