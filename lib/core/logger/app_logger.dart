import 'package:logger/logger.dart';

/// Centralized logger configuration for the app
class AppLogger {
  static Logger? _instance;
  
  /// Get the singleton logger instance
  static Logger get instance {
    _instance ??= Logger(
      printer: PrettyPrinter(
        methodCount: 3, // Show 3 method calls in stack trace
        errorMethodCount: 8, // Show 8 method calls for errors
        lineLength: 120, // Line length for wrapping
        colors: true, // Use colors in console
        printEmojis: true, // Use emojis for different log levels
        printTime: true, // Show timestamp
        excludeBox: {
          Level.trace: false,
          Level.debug: false,
          Level.info: false,
          Level.warning: false,
          Level.error: false,
          Level.fatal: false,
        },
      ),
      level: Level.trace, // Show all levels (trace, debug, info, warning, error, fatal)
    );
    return _instance!;
  }
  
  /// Create a logger with custom tag for better identification
  static Logger createLogger(String tag) {
    return Logger(
      printer: CustomPrefixPrinter(
        tag,
        PrettyPrinter(
          methodCount: 3,
          errorMethodCount: 8,
          lineLength: 120,
          colors: true,
          printEmojis: true,
          printTime: true,
          excludeBox: {
            Level.trace: false,
            Level.debug: false,
            Level.info: false,
            Level.warning: false,
            Level.error: false,
            Level.fatal: false,
          },
        ),
      ),
      level: Level.trace,
    );
  }
  
  /// Log detailed object data
  static void logObject(String title, Object? object, [Logger? logger]) {
    final log = logger ?? instance;
    log.d('$title: ${object.toString()}');
    
    // If it's a Map, log each key-value pair
    if (object is Map) {
      log.d('$title details:');
      object.forEach((key, value) {
        log.d('  $key: $value');
      });
    }
    
    // If it's a List, log each item
    if (object is List) {
      log.d('$title contains ${object.length} items:');
      for (int i = 0; i < object.length; i++) {
        log.d('  [$i]: ${object[i]}');
      }
    }
  }
  
  /// Log request details
  static void logRequest(String endpoint, Map<String, dynamic>? params, [Logger? logger]) {
    final log = logger ?? instance;
    log.i('🚀 API Request: $endpoint');
    if (params != null && params.isNotEmpty) {
      log.d('📋 Request Parameters:');
      params.forEach((key, value) {
        log.d('  $key: $value');
      });
    }
  }
  
  /// Log response details
  static void logResponse(String endpoint, dynamic response, [Logger? logger]) {
    final log = logger ?? instance;
    log.i('✅ API Response: $endpoint');
    logObject('Response Data', response, log);
  }
  
  /// Log error details
  static void logError(String operation, dynamic error, [StackTrace? stackTrace, Logger? logger]) {
    final log = logger ?? instance;
    log.e('❌ Error in $operation: $error');
    if (stackTrace != null) {
      log.e('Stack trace: $stackTrace');
    }
  }
}

/// Custom prefix printer to add tags to log messages
class CustomPrefixPrinter extends LogPrinter {
  final String prefix;
  final LogPrinter _printer;

  CustomPrefixPrinter(this.prefix, this._printer);

  @override
  List<String> log(LogEvent event) {
    final lines = _printer.log(event);
    return lines.map((line) => '[$prefix] $line').toList();
  }
}
