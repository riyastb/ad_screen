import 'dart:io';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import '../app_window_manager.dart';

class CustomTitleBar extends StatefulWidget {
  final Widget child;
  
  const CustomTitleBar({
    super.key,
    required this.child,
  });

  @override
  State<CustomTitleBar> createState() => _CustomTitleBarState();
}

class _CustomTitleBarState extends State<CustomTitleBar> {
  bool _isHovering = false;
  bool _isMaximized = false;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _checkWindowState();
  }

  Future<void> _checkWindowState() async {
    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      final isMaximized = await windowManager.isMaximized();
      final isFullScreen = await windowManager.isFullScreen();
      if (mounted) {
        setState(() {
          _isMaximized = isMaximized;
          _isFullScreen = isFullScreen;
        });
      }
    }
  }

  Future<void> _toggleMaximize() async {
    if (Platform.isWindows) {
      // On Windows, toggle fullscreen to hide/show taskbar
      final isFullScreen = await windowManager.isFullScreen();
      if (isFullScreen) {
        // Exit fullscreen and restore window
        await windowManager.setFullScreen(false);
        await Future.delayed(const Duration(milliseconds: 200));
        await windowManager.restore();
      } else {
        // Maximize first, then set fullscreen
        await windowManager.maximize();
        await Future.delayed(const Duration(milliseconds: 200));
        await windowManager.setFullScreen(true);
      }
    } else {
      // On macOS/Linux, use standard maximize/restore
      if (_isMaximized) {
        await windowManager.restore();
      } else {
        await windowManager.maximize();
      }
    }
    await Future.delayed(const Duration(milliseconds: 300));
    _checkWindowState();
  }

  @override
  Widget build(BuildContext context) {
    // Only show title bar on desktop platforms
    if (!Platform.isWindows && !Platform.isMacOS && !Platform.isLinux) {
      return widget.child;
    }

    return Stack(
      children: [
        widget.child,
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onPanStart: (details) async {
              if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
                // Only allow dragging if not in fullscreen mode
                final isFullScreen = await windowManager.isFullScreen();
                if (!isFullScreen) {
                  windowManager.startDragging();
                }
              }
            },
            child: MouseRegion(
              onEnter: (_) {
                setState(() => _isHovering = true);
                _checkWindowState();
              },
              onExit: (_) => setState(() => _isHovering = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 40,
                color: _isHovering 
                    ? Colors.black.withOpacity(0.1) 
                    : Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  if (_isHovering) ...[
                    _WindowButton(
                      icon: Icons.remove,
                      tooltip: 'Minimize',
                      onPressed: () async {
                        await AppWindowManager.minimizeWindow();
                      },
                    ),
                    _WindowButton(
                      icon: _isFullScreen || _isMaximized 
                          ? Icons.fullscreen_exit 
                          : Icons.fullscreen,
                      tooltip: _isFullScreen || _isMaximized 
                          ? 'Restore' 
                          : 'Maximize',
                      onPressed: _toggleMaximize,
                    ),
                    _WindowButton(
                      icon: Icons.close,
                      tooltip: 'Close',
                      onPressed: () async {
                        await AppWindowManager.closeWindow();
                      },
                      isCloseButton: true,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
     ) ],
    );
  }
}

class _WindowButton extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;
  final bool isCloseButton;

  const _WindowButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
    this.isCloseButton = false,
  });

  @override
  State<_WindowButton> createState() => _WindowButtonState();
}

class _WindowButtonState extends State<_WindowButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Colors.transparent;
    Color iconColor = Colors.white.withOpacity(0.8);

    if (_isHovering) {
      if (widget.isCloseButton) {
        backgroundColor = Colors.red;
        iconColor = Colors.white;
      } else {
        backgroundColor = Colors.white.withOpacity(0.1);
        iconColor = Colors.white;
      }
    }

    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovering = true),
        onExit: (_) => setState(() => _isHovering = false),
        child: GestureDetector(
          onTap: widget.onPressed,
          child: Container(
            width: 46,
            height: 32,
            decoration: BoxDecoration(
              color: backgroundColor,
            ),
            child: Icon(
              widget.icon,
              size: 16,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
