//
//  Generated code. Do not modify.
//  source: exchangerate.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'exchangerate.pb.dart' as $0;

export 'exchangerate.pb.dart';

@$pb.GrpcServiceName('exchangerate.ExchangeRateService')
class ExchangeRateServiceClient extends $grpc.Client {
  static final _$create = $grpc.ClientMethod<$0.RateReq, $0.Response>(
      '/exchangerate.ExchangeRateService/Create',
      ($0.RateReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$updateAllByID = $grpc.ClientMethod<$0.Payload, $0.Response>(
      '/exchangerate.ExchangeRateService/UpdateAllByID',
      ($0.Payload value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$getBranchByLongitudeAndLatitude = $grpc.ClientMethod<$0.GetReq, $0.Payload>(
      '/exchangerate.ExchangeRateService/GetBranchByLongitudeAndLatitude',
      ($0.GetReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Payload.fromBuffer(value));
  static final _$getAllByBranch = $grpc.ClientMethod<$0.GetReq, $0.Payload>(
      '/exchangerate.ExchangeRateService/GetAllByBranch',
      ($0.GetReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Payload.fromBuffer(value));
  static final _$createBannerDecrption = $grpc.ClientMethod<$0.Banner, $0.Response>(
      '/exchangerate.ExchangeRateService/CreateBannerDecrption',
      ($0.Banner value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Response.fromBuffer(value));

  ExchangeRateServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.Response> create($0.RateReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> updateAllByID($async.Stream<$0.Payload> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$updateAllByID, request, options: options).single;
  }

  $grpc.ResponseStream<$0.Payload> getBranchByLongitudeAndLatitude($0.GetReq request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$getBranchByLongitudeAndLatitude, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseStream<$0.Payload> getAllByBranch($0.GetReq request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$getAllByBranch, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.Response> createBannerDecrption($0.Banner request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createBannerDecrption, request, options: options);
  }
}

@$pb.GrpcServiceName('exchangerate.ExchangeRateService')
abstract class ExchangeRateServiceBase extends $grpc.Service {
  $core.String get $name => 'exchangerate.ExchangeRateService';

  ExchangeRateServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.RateReq, $0.Response>(
        'Create',
        create_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RateReq.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Payload, $0.Response>(
        'UpdateAllByID',
        updateAllByID,
        true,
        false,
        ($core.List<$core.int> value) => $0.Payload.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetReq, $0.Payload>(
        'GetBranchByLongitudeAndLatitude',
        getBranchByLongitudeAndLatitude_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.GetReq.fromBuffer(value),
        ($0.Payload value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetReq, $0.Payload>(
        'GetAllByBranch',
        getAllByBranch_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.GetReq.fromBuffer(value),
        ($0.Payload value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Banner, $0.Response>(
        'CreateBannerDecrption',
        createBannerDecrption_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Banner.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
  }

  $async.Future<$0.Response> create_Pre($grpc.ServiceCall call, $async.Future<$0.RateReq> request) async {
    return create(call, await request);
  }

  $async.Stream<$0.Payload> getBranchByLongitudeAndLatitude_Pre($grpc.ServiceCall call, $async.Future<$0.GetReq> request) async* {
    yield* getBranchByLongitudeAndLatitude(call, await request);
  }

  $async.Stream<$0.Payload> getAllByBranch_Pre($grpc.ServiceCall call, $async.Future<$0.GetReq> request) async* {
    yield* getAllByBranch(call, await request);
  }

  $async.Future<$0.Response> createBannerDecrption_Pre($grpc.ServiceCall call, $async.Future<$0.Banner> request) async {
    return createBannerDecrption(call, await request);
  }

  $async.Future<$0.Response> create($grpc.ServiceCall call, $0.RateReq request);
  $async.Future<$0.Response> updateAllByID($grpc.ServiceCall call, $async.Stream<$0.Payload> request);
  $async.Stream<$0.Payload> getBranchByLongitudeAndLatitude($grpc.ServiceCall call, $0.GetReq request);
  $async.Stream<$0.Payload> getAllByBranch($grpc.ServiceCall call, $0.GetReq request);
  $async.Future<$0.Response> createBannerDecrption($grpc.ServiceCall call, $0.Banner request);
}
