import 'dart:math' as math;
import 'package:flutter/material.dart';

class FlipCardAnimationWidget extends StatefulWidget {
  final Widget front;
  final Widget back;

  const FlipCardAnimationWidget({
    super.key,
    required this.front,
    required this.back,
  });

  @override
  State<FlipCardAnimationWidget> createState() =>
      FlipCardAnimationWidgetState();
}

class FlipCardAnimationWidgetState extends State<FlipCardAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
  }

  void flip() {
    if (_isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    _isFront = !_isFront;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        final angle = _controller.value * 2 * math.pi; // 360 degrees rotation
        final transform = Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(angle);

        Widget currentChild;
        if (_controller.value < 0.5) {
          currentChild = widget.front;
        } else {
          currentChild = widget.back;
        }

        return Transform(
          transform: transform,
          alignment: Alignment.center,
          child: currentChild,
        );
      },
    );
  }
}
