import 'dart:io';
import 'package:flutter/material.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:window_manager/window_manager.dart';

class AppWindowManager {
  static Size logInScreenSize = const Size(1100, 660);
  static Size loggedInMinSize = const Size(1366, 768);
  static String title = "IntellEx Fintech Suite";

  static Future<void> setWindowManagerService(
      bool isLoggedIn, {
        bool isLoggedInMinimize = false,
      }) async {
    // print('Setting window manager service. Logged in: $isLoggedIn');

    // Ensure window manager is initialized
    await windowManager.ensureInitialized();

    // Set title bar style to frameless (we'll show custom buttons on hover)
    if (Platform.isWindows || Platform.isMacOS) {
      await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
    }

    WindowOptions windowOptions = WindowOptions(
      center: true,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden, // Frameless window
    );

    if (Platform.isWindows || Platform.isMacOS) {
      if (isLoggedIn) {
        windowOptions = await _setLoggedInWindowOptions();
      } else {
        windowOptions = await _setLoggedOutWindowOptions(isLoggedInMinimize);
      }
    }

    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      // print('Window ready to show. Setting up...');
      if (isLoggedIn) {
        await setLoggedInOptions();
      } else {
        await _setLoggedOutOptions(isLoggedInMinimize);
      }
    });
  }

  static Future<WindowOptions> _setLoggedInWindowOptions() async {
    try {
      final screen = await screenRetriever.getPrimaryDisplay();
      final screenSize = screen.size;

      // Calculate dynamic minimum size
      final dynamicMinSize = Size(
        loggedInMinSize.width > screenSize.width
            ? screenSize.width * 0.9
            : loggedInMinSize.width,
        loggedInMinSize.height > screenSize.height
            ? screenSize.height * 0.9
            : loggedInMinSize.height,
      );

      return WindowOptions(
        title: title,
        backgroundColor: Colors.blue,
        minimumSize: dynamicMinSize,
        maximumSize: screenSize,
        size: screenSize,
        center: true,
        skipTaskbar: false,
        fullScreen: false, // We'll set this separately
        titleBarStyle: TitleBarStyle.hidden, // Frameless window
        alwaysOnTop: false,
      );
    } catch (e) {
      print('Error in _setLoggedInWindowOptions: $e');
      return WindowOptions(
        title: title,
        backgroundColor: Colors.blue,
        minimumSize: loggedInMinSize,
        maximumSize: Size.infinite,
        size: loggedInMinSize,
        center: true,
        skipTaskbar: false,
        fullScreen: false,
        titleBarStyle: TitleBarStyle.hidden, // Frameless window
      );
    }
  }

  static Future<WindowOptions> _setLoggedOutWindowOptions(
      bool isLoggedInMinimize,
      ) async {
    final size = isLoggedInMinimize ? loggedInMinSize : logInScreenSize;

    return WindowOptions(
      title: title,
      backgroundColor: Colors.blue,
      minimumSize: size,
      maximumSize: size,
      size: size,
      center: true,
      skipTaskbar: false,
      fullScreen: false,
      // resizable: false,
      titleBarStyle: TitleBarStyle.hidden, // Frameless window
      alwaysOnTop: false,
    );
  }

  static Future<void> setLoggedInOptions() async {
    // print('=== Setting logged in options ===');

    try {
      // Ensure window is visible and active
      await windowManager.show();
      await windowManager.restore();
      await windowManager.focus();

      await Future.delayed(const Duration(milliseconds: 100));

      if (Platform.isMacOS) {
        await _setupMacOSWindow();
      } else if (Platform.isWindows) {
        await _setupWindowsWindow();
      } else if (Platform.isLinux) {
        await _setupLinuxWindow();
      }

      // Final adjustments
      await _finalizeWindowSetup();

      // print('=== Logged in options set successfully ===');
    } catch (e) {
      print('!!! Error in setLoggedInOptions: $e');
      await _emergencyFallback();
    }
  }

  static Future<void> _setupMacOSWindow() async {
    // print('Setting up macOS window...');
    try {
      final screen = await screenRetriever.getPrimaryDisplay();
      final screenSize = screen.size;

      // Set window properties
      await windowManager.setMinimumSize(loggedInMinSize);
      await windowManager.setMaximumSize(screenSize);
      await windowManager.setResizable(true);
      await windowManager.setSkipTaskbar(false);

      // Set to screen size
      await windowManager.setSize(screenSize);
      await Future.delayed(const Duration(milliseconds: 100));

      // Center window
      await windowManager.center();
      await Future.delayed(const Duration(milliseconds: 100));

      // Enter fullscreen
      // print('Entering fullscreen on macOS...');
      await windowManager.setFullScreen(true);
      await Future.delayed(const Duration(milliseconds: 200));

      // print('macOS window setup complete');
    } catch (e) {
      print('macOS setup error: $e');
      rethrow;
    }
  }

  static Future<void> _setupWindowsWindow() async {
    // print('Setting up Windows window...');
    try {
      final screen = await screenRetriever.getPrimaryDisplay();
      final screenSize = screen.size;

      // Calculate dynamic minimum size
      final dynamicMinSize = Size(
        loggedInMinSize.width > screenSize.width
            ? screenSize.width * 0.85
            : loggedInMinSize.width,
        loggedInMinSize.height > screenSize.height
            ? screenSize.height * 0.85
            : loggedInMinSize.height,
      );

      // Set window properties
      await windowManager.setMinimumSize(dynamicMinSize);
      await windowManager.setMaximumSize(screenSize);
      await windowManager.setResizable(true);
      await windowManager.setSkipTaskbar(false);
      await windowManager.setMaximizable(true);
      await windowManager.setMinimizable(true);
      await windowManager.setClosable(true);

      // Keep frameless window (custom buttons will show on hover)
      await windowManager.setTitleBarStyle(TitleBarStyle.hidden);

      // Ensure window has shadow (looks better)
      await windowManager.setHasShadow(true);

      // First maximize to ensure proper window state
      // print('Maximizing window...');
      await windowManager.maximize();
      await Future.delayed(const Duration(milliseconds: 300));

      // Set fullscreen to hide taskbar
      // print('Setting fullscreen to hide taskbar...');
      await windowManager.setFullScreen(true);
      await Future.delayed(const Duration(milliseconds: 300));

      // Verify fullscreen state
      final isFullScreen = await windowManager.isFullScreen();
      // print('Windows fullscreen verification: $isFullScreen');

      // If fullscreen didn't work, use workaround
      if (!isFullScreen) {
        // print('Fullscreen not set, trying workaround to hide taskbar...');
        await _windowsFullscreenWorkaround();
      }

      // print('Windows window setup complete - Fullscreen mode (taskbar hidden)');
    } catch (e) {
      print('Windows setup error: $e');
      rethrow;
    }
  }

  static Future<void> _setupLinuxWindow() async {
    // print('Setting up Linux window...');
    try {
      final screen = await screenRetriever.getPrimaryDisplay();
      final screenSize = screen.size;

      await windowManager.setMinimumSize(loggedInMinSize);
      await windowManager.setMaximumSize(screenSize);
      await windowManager.setResizable(true);

      // Set to screen size
      await windowManager.setSize(screenSize);
      await Future.delayed(const Duration(milliseconds: 100));

      // Try to maximize (Linux fullscreen support varies)
      await windowManager.maximize();
      await Future.delayed(const Duration(milliseconds: 100));

      // Try fullscreen
      try {
        await windowManager.setFullScreen(true);
      } catch (e) {
        print('Linux fullscreen not supported, using maximized');
      }

      print('Linux window setup complete');
    } catch (e) {
      print('Linux setup error: $e');
      rethrow;
    }
  }

  static Future<void> _windowsFullscreenWorkaround() async {
    // print('Applying Windows fullscreen workaround...');
    try {
      final screen = await screenRetriever.getPrimaryDisplay();
      final screenSize = screen.size;

      // Set to exact screen size at position 0,0
      await windowManager.setSize(screenSize);
      await windowManager.setPosition(const Offset(0, 0));

      // Keep frameless window (custom buttons will show on hover)
      await windowManager.setTitleBarStyle(TitleBarStyle.hidden);

      // Try to hide taskbar by maximizing
      await windowManager.maximize();
      await Future.delayed(const Duration(milliseconds: 200));

      // print('Windows workaround applied');
    } catch (e) {
      print('Windows workaround error: $e');
    }
  }

  static Future<void> _finalizeWindowSetup() async {
    // print('Finalizing window setup...');
    try {
      // Wait for everything to settle
      await Future.delayed(const Duration(milliseconds: 500));

      // Bring to front
      await windowManager.setAlwaysOnTop(true);
      await windowManager.focus();
      await Future.delayed(const Duration(milliseconds: 100));
      await windowManager.setAlwaysOnTop(false);

      // Verify final state
      final isMaximized = await windowManager.isMaximized();

      // print('Final window state - Maximized: $isMaximized');

      // Ensure window is expanded/maximized
      if (!isMaximized) {
        // print('Window not maximized, ensuring expanded state...');
        await windowManager.maximize();
        await Future.delayed(const Duration(milliseconds: 200));
      }

      // print('Window setup finalized - Expanded mode');
    } catch (e) {
      print('Error in finalizeWindowSetup: $e');
    }
  }

  static Future<void> _emergencyFallback() async {
    // print('!!! Using emergency fallback !!!');
    try {
      // Simple reliable setup
      await windowManager.maximize();
      await windowManager.center();
      await windowManager.focus();

      // Set reasonable size if maximize fails
      final screen = await screenRetriever.getPrimaryDisplay();
      final screenSize = screen.size;
      await windowManager.setSize(Size(
        screenSize.width * 0.95,
        screenSize.height * 0.95,
      ));
      await windowManager.center();

      // print('Emergency fallback applied');
    } catch (e) {
      print('Emergency fallback also failed: $e');
    }
  }

  static Future<void> _setLoggedOutOptions(bool isLoggedInMinimize) async {
    final size = isLoggedInMinimize ? loggedInMinSize : logInScreenSize;

    // print('Setting logged out options. Size: $size');

    try {
      // Exit fullscreen first
      await windowManager.setFullScreen(false);
      await Future.delayed(const Duration(milliseconds: 100));

      if (Platform.isMacOS) {
        await _setupLoggedOutMacOS(size);
      } else if (Platform.isWindows) {
        await _setupLoggedOutWindows(size);
      } else if (Platform.isLinux) {
        await _setupLoggedOutLinux(size);
      }

      // Bring to front temporarily
      await windowManager.setAlwaysOnTop(true);
      await windowManager.focus();
      await Future.delayed(const Duration(seconds: 1));
      await windowManager.setAlwaysOnTop(false);

      // print('Logged out options set successfully');
    } catch (e) {
      print('Error in _setLoggedOutOptions: $e');
      await _loggedOutEmergencyFallback(size);
    }
  }

  static Future<void> _setupLoggedOutMacOS(Size size) async {
    await windowManager.setSize(size, animate: true);
    await windowManager.setMinimumSize(size);
    await windowManager.setMaximumSize(size);
    await windowManager.setResizable(false);
    await windowManager.center(animate: true);
  }

  static Future<void> _setupLoggedOutWindows(Size size) async {
    await windowManager.setSize(size, animate: true);
    await windowManager.setMinimumSize(size);
    await windowManager.setMaximumSize(size);
    await windowManager.setResizable(false);

    // Center on screen
    final screen = await screenRetriever.getPrimaryDisplay();
    final screenSize = screen.size;

    final double centerX = (screenSize.width - size.width) / 2;
    final double centerY = (screenSize.height - size.height) / 2;

    await windowManager.setPosition(
      Offset(centerX, centerY),
      animate: true,
    );
  }

  static Future<void> _setupLoggedOutLinux(Size size) async {
    await windowManager.setSize(size, animate: true);
    await windowManager.setMinimumSize(size);
    await windowManager.setMaximumSize(size);
    await windowManager.setResizable(false);
    await windowManager.center(animate: true);
  }

  static Future<void> _loggedOutEmergencyFallback(Size size) async {
    await windowManager.setSize(size);
    await windowManager.center();
  }

  // ========== PUBLIC HELPER METHODS ==========

  static Future<void> forceFullscreen() async {
    // print('=== Forcing fullscreen ===');
    try {
      // Exit fullscreen if already in it
      await windowManager.setFullScreen(false);
      await Future.delayed(const Duration(milliseconds: 200));

      // Maximize first
      await windowManager.maximize();
      await Future.delayed(const Duration(milliseconds: 200));

      // Enter fullscreen
      await windowManager.setFullScreen(true);

      // Verify
      await Future.delayed(const Duration(milliseconds: 300));
      final isFullScreen = await windowManager.isFullScreen();

      // print('Force fullscreen result: $isFullScreen');

      if (!isFullScreen && Platform.isWindows) {
        await _windowsFullscreenWorkaround();
      }

    } catch (e) {
      print('Error in forceFullscreen: $e');
    }
  }

  static Future<void> validateAndFixWindow() async {
    // print('=== Validating window state ===');
    try {
      final isVisible = await windowManager.isVisible();
      final isMinimized = await windowManager.isMinimized();
      final isFullScreen = await windowManager.isFullScreen();

     // print('Current state - Visible: $isVisible, Minimized: $isMinimized, FullScreen: $isFullScreen');

      if (!isVisible) {
        await windowManager.show();
      //  print('Window shown');
      }

      if (isMinimized) {
        await windowManager.restore();
  //      print('Window restored');
      }

      // If window is supposed to be fullscreen but isn't
      if (!isFullScreen) {
    //    print('Window not fullscreen, attempting to fix...');
        await forceFullscreen();
      }

      await windowManager.focus();
   //   print('Window focused');

    } catch (e) {
//      print('Error in validateAndFixWindow: $e');
    }
  }

  static Future<void> minimizeWindow() async {
    try {
      await windowManager.minimize();
    } catch (e) {
   //   print('Error minimizing window: $e');
    }
  }

  static Future<void> closeWindow() async {
    try {
      await windowManager.close();
    } catch (e) {
      print('Error closing window: $e');
    }
  }

  static Future<bool> isFullscreen() async {
    try {
      return await windowManager.isFullScreen();
    } catch (e) {
      print('Error checking fullscreen: $e');
      return false;
    }
  }

  static Future<void> toggleFullscreen() async {
    try {
      final isFullScreen = await windowManager.isFullScreen();
      if (isFullScreen) {
        await windowManager.setFullScreen(false);
        // Restore to reasonable size
        await Future.delayed(const Duration(milliseconds: 100));
        final screen = await screenRetriever.getPrimaryDisplay();
        final screenSize = screen.size;
        await windowManager.setSize(Size(
          screenSize.width * 0.8,
          screenSize.height * 0.8,
        ));
        await windowManager.center();
      } else {
        await forceFullscreen();
      }
    } catch (e) {
      print('Error toggling fullscreen: $e');
    }
  }

  static Future<void> ensureWindowInBounds() async {
    try {
      final screen = await screenRetriever.getPrimaryDisplay();
      final screenSize = screen.size;
      final windowBounds = await windowManager.getBounds();

      double newLeft = windowBounds.left;
      double newTop = windowBounds.top;
      bool needsFix = false;

      // Check boundaries
      if (windowBounds.left < 0) {
        newLeft = 0.0;
        needsFix = true;
      }
      if (windowBounds.top < 0) {
        newTop = 0.0;
        needsFix = true;
      }
      if (windowBounds.left + windowBounds.width > screenSize.width) {
        newLeft = screenSize.width - windowBounds.width;
        needsFix = true;
      }
      if (windowBounds.top + windowBounds.height > screenSize.height) {
        newTop = screenSize.height - windowBounds.height;
        needsFix = true;
      }

      if (needsFix) {
     //   print('Adjusting window position to stay in bounds');
        await windowManager.setPosition(
          Offset(newLeft, newTop),
          animate: true,
        );
      }
    } catch (e) {
      print('Error in ensureWindowInBounds: $e');
    }
  }
}