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
  static final _$getBranchRateByLongitudeAndLatitude = $grpc.ClientMethod<$0.GetReq, $0.RateData>(
      '/exchangerate.ExchangeRateService/GetBranchRateByLongitudeAndLatitude',
      ($0.GetReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RateData.fromBuffer(value));
  static final _$getAllByBranch = $grpc.ClientMethod<$0.GetReq, $0.RateData>(
      '/exchangerate.ExchangeRateService/GetAllByBranch',
      ($0.GetReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RateData.fromBuffer(value));
  static final _$createBannerDescription = $grpc.ClientMethod<$0.Banner, $0.Response>(
      '/exchangerate.ExchangeRateService/CreateBannerDescription',
      ($0.Banner value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$uploadImage = $grpc.ClientMethod<$0.ImageData, $0.Response>(
      '/exchangerate.ExchangeRateService/UploadImage',
      ($0.ImageData value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$downloadImage = $grpc.ClientMethod<$0.ImageReq, $0.ImageData>(
      '/exchangerate.ExchangeRateService/DownloadImage',
      ($0.ImageReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ImageData.fromBuffer(value));

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

  $grpc.ResponseFuture<$0.RateData> getBranchRateByLongitudeAndLatitude($0.GetReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBranchRateByLongitudeAndLatitude, request, options: options);
  }

  $grpc.ResponseFuture<$0.RateData> getAllByBranch($0.GetReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAllByBranch, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> createBannerDescription($async.Stream<$0.Banner> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$createBannerDescription, request, options: options).single;
  }

  $grpc.ResponseFuture<$0.Response> uploadImage($0.ImageData request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$uploadImage, request, options: options);
  }

  $grpc.ResponseFuture<$0.ImageData> downloadImage($0.ImageReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$downloadImage, request, options: options);
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
    $addMethod($grpc.ServiceMethod<$0.GetReq, $0.RateData>(
        'GetBranchRateByLongitudeAndLatitude',
        getBranchRateByLongitudeAndLatitude_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetReq.fromBuffer(value),
        ($0.RateData value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetReq, $0.RateData>(
        'GetAllByBranch',
        getAllByBranch_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetReq.fromBuffer(value),
        ($0.RateData value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Banner, $0.Response>(
        'CreateBannerDescription',
        createBannerDescription,
        true,
        false,
        ($core.List<$core.int> value) => $0.Banner.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ImageData, $0.Response>(
        'UploadImage',
        uploadImage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ImageData.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ImageReq, $0.ImageData>(
        'DownloadImage',
        downloadImage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ImageReq.fromBuffer(value),
        ($0.ImageData value) => value.writeToBuffer()));
  }

  $async.Future<$0.Response> create_Pre($grpc.ServiceCall call, $async.Future<$0.RateReq> request) async {
    return create(call, await request);
  }

  $async.Future<$0.RateData> getBranchRateByLongitudeAndLatitude_Pre($grpc.ServiceCall call, $async.Future<$0.GetReq> request) async {
    return getBranchRateByLongitudeAndLatitude(call, await request);
  }

  $async.Future<$0.RateData> getAllByBranch_Pre($grpc.ServiceCall call, $async.Future<$0.GetReq> request) async {
    return getAllByBranch(call, await request);
  }

  $async.Future<$0.Response> uploadImage_Pre($grpc.ServiceCall call, $async.Future<$0.ImageData> request) async {
    return uploadImage(call, await request);
  }

  $async.Future<$0.ImageData> downloadImage_Pre($grpc.ServiceCall call, $async.Future<$0.ImageReq> request) async {
    return downloadImage(call, await request);
  }

  $async.Future<$0.Response> create($grpc.ServiceCall call, $0.RateReq request);
  $async.Future<$0.Response> updateAllByID($grpc.ServiceCall call, $async.Stream<$0.Payload> request);
  $async.Future<$0.RateData> getBranchRateByLongitudeAndLatitude($grpc.ServiceCall call, $0.GetReq request);
  $async.Future<$0.RateData> getAllByBranch($grpc.ServiceCall call, $0.GetReq request);
  $async.Future<$0.Response> createBannerDescription($grpc.ServiceCall call, $async.Stream<$0.Banner> request);
  $async.Future<$0.Response> uploadImage($grpc.ServiceCall call, $0.ImageData request);
  $async.Future<$0.ImageData> downloadImage($grpc.ServiceCall call, $0.ImageReq request);
}
