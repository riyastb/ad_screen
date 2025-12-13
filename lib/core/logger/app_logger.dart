import 'dart:async';

import 'package:dio/dio.dart' as dio;
import 'package:grpc/grpc.dart' hide Response;
import 'package:logger/logger.dart';

/// Dio interceptor for logging HTTP requests and responses
class DioLoggerInterceptor extends dio.Interceptor {
  static final DioLoggerInterceptor _instance = DioLoggerInterceptor._();

  static DioLoggerInterceptor get instance => _instance;

  DioLoggerInterceptor._();

  @override
  void onRequest(dio.RequestOptions options, dio.RequestInterceptorHandler handler) {
    options.extra['start_time'] = DateTime.now(); // track duration
    Logger().d(
      "----- HTTP Logger Request -----\n"
      "Method: ${options.method}\n"
      "URL: ${options.uri}\n"
      "Headers: ${options.headers}\n"
      "Data: ${options.data}\n",
    );
    handler.next(options);
  }

  @override
  void onResponse(dio.Response response, dio.ResponseInterceptorHandler handler) {
    final start = response.requestOptions.extra['start_time'] as DateTime?;
    final duration = start != null ? DateTime.now().difference(start).inMilliseconds : null;

    Logger().d(
      "----- HTTP Logger Response -----\n"
      "URL: ${response.requestOptions.uri}\n"
      "Status Code: ${response.statusCode}\n"
      "Duration: ${duration != null ? '$duration ms' : 'N/A'}\n"
      "Data: ${response.data}\n",
    );
    handler.next(response);
  }

  @override
  void onError(dio.DioException err, dio.ErrorInterceptorHandler handler) {
    Logger().e(
      "----- HTTP Logger Error -----\n"
          "URL: ${err.requestOptions.uri}\n"
          "Status: ${err.response?.statusCode}\n"
          "Message: ${err.message}\n"
          "Response: ${err.response?.data}\n",
    );
    handler.next(err);
  }
}

/// gRPC interceptor for logging gRPC requests and responses
class LoggerInterceptor extends ClientInterceptor {
  static final LoggerInterceptor _instance = LoggerInterceptor._();

  static LoggerInterceptor get instance => _instance;

  LoggerInterceptor._();

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
      ClientMethod<Q, R> method, Q request, CallOptions options, ClientUnaryInvoker<Q, R> invoker) {
    Logger().d("----- gRPC Logger Request -----"
        "Method: ${method.path}\n"
        "Request: \n$request");

    final response = super.interceptUnary(method, request, options, invoker);

    response.then((r) {
      Logger().d("-----gRPC Logger Response-----"
          "Method: ${method.path}\n"
          "Response: \n$r");
    }).catchError((error) {
      Logger().e("-----gRPC Error Start-----\n"
          "Method: ${method.path}\n"
          "Error: $error\n"
          "Error Message: ${error is GrpcError ? error.message : ''}");
    });

    return response;
  }

  @override
  ResponseStream<R> interceptStreaming<Q, R>(ClientMethod<Q, R> method, Stream<Q> requests,
      CallOptions options, ClientStreamingInvoker<Q, R> invoker) {
    final loggedRequestStream = requests.map((requestItem) {
      Logger().d("-----gRPC Logger Stream Request-----\n"
          "Method: ${method.path}\n"
          "Request: \n$requestItem");
      return requestItem;
    });

    final responseStream = invoker(method, loggedRequestStream, options);

    return LoggingResponseStream(responseStream, method as ClientMethod<dynamic, R>);
  }
}

class LoggingResponseStream<R> extends StreamView<R> implements ResponseStream<R> {
  final ResponseStream<R> _inner;
  final ClientMethod<dynamic, R> method;
  static final Logger _logger = Logger();

  LoggingResponseStream(this._inner, this.method) : super(_inner.asBroadcastStream());

  @override
  Future<Map<String, String>> get headers => _inner.headers;

  @override
  Future<Map<String, String>> get trailers => _inner.trailers;

  @override
  Future<void> cancel() => _inner.cancel();

  @override
  ResponseFuture<R> get single => _inner.single;

  @override
  StreamSubscription<R> listen(void Function(R)? onData,
      {Function? onError, void Function()? onDone, bool? cancelOnError}) {
    List<R> collectedData = [];

    return super.listen((data) {
      collectedData.add(data);
      onData?.call(data);
    }, onError: (e, stackTrace) {
      final errorMessage = (e is GrpcError) ? e.message : e.toString();
      _logger.e("----- gRPC Stream Error -----\n"
          "Method: ${method.path}\n"
          "Error: $e\n"
          "Error Message: $errorMessage\n");

      if (onError != null) {
        if (onError is Function(Object, StackTrace)) {
          onError(e, stackTrace ?? StackTrace.current);
        } else {
          onError(e);
        }
      }
    }, onDone: () {
      _logger.d("-----gRPC Logger Stream Response-----\n"
          "Method: ${method.path}\n"
          "Response: $collectedData");
      onDone?.call();
    }, cancelOnError: cancelOnError);
  }
}
