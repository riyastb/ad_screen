//
//  Generated code. Do not modify.
//  source: exchangerate.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class RateReq extends $pb.GeneratedMessage {
  factory RateReq({
    $core.Iterable<Payload>? payload,
  }) {
    final $result = create();
    if (payload != null) {
      $result.payload.addAll(payload);
    }
    return $result;
  }
  RateReq._() : super();
  factory RateReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RateReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RateReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'exchangerate'), createEmptyInstance: create)
    ..pc<Payload>(1, _omitFieldNames ? '' : 'Payload', $pb.PbFieldType.PM, protoName: 'Payload', subBuilder: Payload.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RateReq clone() => RateReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RateReq copyWith(void Function(RateReq) updates) => super.copyWith((message) => updates(message as RateReq)) as RateReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RateReq create() => RateReq._();
  RateReq createEmptyInstance() => create();
  static $pb.PbList<RateReq> createRepeated() => $pb.PbList<RateReq>();
  @$core.pragma('dart2js:noInline')
  static RateReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RateReq>(create);
  static RateReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Payload> get payload => $_getList(0);
}

class RateData extends $pb.GeneratedMessage {
  factory RateData({
    $core.Iterable<Payload>? payload,
    $core.String? tickerBannerDescription,
    $core.String? offerDescription,
    $core.String? adImageUrl,
  }) {
    final $result = create();
    if (payload != null) {
      $result.payload.addAll(payload);
    }
    if (tickerBannerDescription != null) {
      $result.tickerBannerDescription = tickerBannerDescription;
    }
    if (offerDescription != null) {
      $result.offerDescription = offerDescription;
    }
    if (adImageUrl != null) {
      $result.adImageUrl = adImageUrl;
    }
    return $result;
  }
  RateData._() : super();
  factory RateData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RateData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RateData', package: const $pb.PackageName(_omitMessageNames ? '' : 'exchangerate'), createEmptyInstance: create)
    ..pc<Payload>(1, _omitFieldNames ? '' : 'Payload', $pb.PbFieldType.PM, protoName: 'Payload', subBuilder: Payload.create)
    ..aOS(2, _omitFieldNames ? '' : 'TickerBannerDescription', protoName: 'TickerBannerDescription')
    ..aOS(3, _omitFieldNames ? '' : 'OfferDescription', protoName: 'OfferDescription')
    ..aOS(4, _omitFieldNames ? '' : 'AdImageUrl', protoName: 'AdImageUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RateData clone() => RateData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RateData copyWith(void Function(RateData) updates) => super.copyWith((message) => updates(message as RateData)) as RateData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RateData create() => RateData._();
  RateData createEmptyInstance() => create();
  static $pb.PbList<RateData> createRepeated() => $pb.PbList<RateData>();
  @$core.pragma('dart2js:noInline')
  static RateData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RateData>(create);
  static RateData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Payload> get payload => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get tickerBannerDescription => $_getSZ(1);
  @$pb.TagNumber(2)
  set tickerBannerDescription($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTickerBannerDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearTickerBannerDescription() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get offerDescription => $_getSZ(2);
  @$pb.TagNumber(3)
  set offerDescription($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOfferDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearOfferDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get adImageUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set adImageUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAdImageUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearAdImageUrl() => clearField(4);
}

class Payload extends $pb.GeneratedMessage {
  factory Payload({
    $core.String? id,
    $core.String? branchName,
    $core.String? branchCode,
    $core.String? countryName,
    $core.String? countryCode,
    $core.String? countryFlag,
    $core.String? currencyName,
    $core.String? currencyCode,
    $core.String? remittanceRate,
    $core.String? remittanceCharge,
    $core.String? forexBuyRate,
    $core.String? forexSellRate,
    $core.String? forexBuyCharge,
    $core.String? forexSellCharge,
    $core.String? priorityCurrency,
    $core.String? lastModifiedUserId,
    $core.String? lastModifiedUserName,
    $core.String? lastModifiedDate,
    $core.String? lastModifiedTime,
    $fixnum.Int64? active,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (branchName != null) {
      $result.branchName = branchName;
    }
    if (branchCode != null) {
      $result.branchCode = branchCode;
    }
    if (countryName != null) {
      $result.countryName = countryName;
    }
    if (countryCode != null) {
      $result.countryCode = countryCode;
    }
    if (countryFlag != null) {
      $result.countryFlag = countryFlag;
    }
    if (currencyName != null) {
      $result.currencyName = currencyName;
    }
    if (currencyCode != null) {
      $result.currencyCode = currencyCode;
    }
    if (remittanceRate != null) {
      $result.remittanceRate = remittanceRate;
    }
    if (remittanceCharge != null) {
      $result.remittanceCharge = remittanceCharge;
    }
    if (forexBuyRate != null) {
      $result.forexBuyRate = forexBuyRate;
    }
    if (forexSellRate != null) {
      $result.forexSellRate = forexSellRate;
    }
    if (forexBuyCharge != null) {
      $result.forexBuyCharge = forexBuyCharge;
    }
    if (forexSellCharge != null) {
      $result.forexSellCharge = forexSellCharge;
    }
    if (priorityCurrency != null) {
      $result.priorityCurrency = priorityCurrency;
    }
    if (lastModifiedUserId != null) {
      $result.lastModifiedUserId = lastModifiedUserId;
    }
    if (lastModifiedUserName != null) {
      $result.lastModifiedUserName = lastModifiedUserName;
    }
    if (lastModifiedDate != null) {
      $result.lastModifiedDate = lastModifiedDate;
    }
    if (lastModifiedTime != null) {
      $result.lastModifiedTime = lastModifiedTime;
    }
    if (active != null) {
      $result.active = active;
    }
    return $result;
  }
  Payload._() : super();
  factory Payload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Payload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Payload', package: const $pb.PackageName(_omitMessageNames ? '' : 'exchangerate'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Id', protoName: 'Id')
    ..aOS(2, _omitFieldNames ? '' : 'BranchName', protoName: 'BranchName')
    ..aOS(3, _omitFieldNames ? '' : 'BranchCode', protoName: 'BranchCode')
    ..aOS(4, _omitFieldNames ? '' : 'CountryName', protoName: 'CountryName')
    ..aOS(5, _omitFieldNames ? '' : 'CountryCode', protoName: 'CountryCode')
    ..aOS(6, _omitFieldNames ? '' : 'CountryFlag', protoName: 'CountryFlag')
    ..aOS(7, _omitFieldNames ? '' : 'CurrencyName', protoName: 'CurrencyName')
    ..aOS(8, _omitFieldNames ? '' : 'CurrencyCode', protoName: 'CurrencyCode')
    ..aOS(9, _omitFieldNames ? '' : 'RemittanceRate', protoName: 'RemittanceRate')
    ..aOS(10, _omitFieldNames ? '' : 'RemittanceCharge', protoName: 'RemittanceCharge')
    ..aOS(11, _omitFieldNames ? '' : 'ForexBuyRate', protoName: 'ForexBuyRate')
    ..aOS(12, _omitFieldNames ? '' : 'ForexSellRate', protoName: 'ForexSellRate')
    ..aOS(13, _omitFieldNames ? '' : 'ForexBuyCharge', protoName: 'ForexBuyCharge')
    ..aOS(14, _omitFieldNames ? '' : 'ForexSellCharge', protoName: 'ForexSellCharge')
    ..aOS(15, _omitFieldNames ? '' : 'PriorityCurrency', protoName: 'PriorityCurrency')
    ..aOS(16, _omitFieldNames ? '' : 'LastModifiedUserId', protoName: 'LastModifiedUserId')
    ..aOS(17, _omitFieldNames ? '' : 'LastModifiedUserName', protoName: 'LastModifiedUserName')
    ..aOS(18, _omitFieldNames ? '' : 'LastModifiedDate', protoName: 'LastModifiedDate')
    ..aOS(19, _omitFieldNames ? '' : 'LastModifiedTime', protoName: 'LastModifiedTime')
    ..aInt64(20, _omitFieldNames ? '' : 'Active', protoName: 'Active')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Payload clone() => Payload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Payload copyWith(void Function(Payload) updates) => super.copyWith((message) => updates(message as Payload)) as Payload;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Payload create() => Payload._();
  Payload createEmptyInstance() => create();
  static $pb.PbList<Payload> createRepeated() => $pb.PbList<Payload>();
  @$core.pragma('dart2js:noInline')
  static Payload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Payload>(create);
  static Payload? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get branchName => $_getSZ(1);
  @$pb.TagNumber(2)
  set branchName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBranchName() => $_has(1);
  @$pb.TagNumber(2)
  void clearBranchName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get branchCode => $_getSZ(2);
  @$pb.TagNumber(3)
  set branchCode($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBranchCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearBranchCode() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get countryName => $_getSZ(3);
  @$pb.TagNumber(4)
  set countryName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCountryName() => $_has(3);
  @$pb.TagNumber(4)
  void clearCountryName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get countryCode => $_getSZ(4);
  @$pb.TagNumber(5)
  set countryCode($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCountryCode() => $_has(4);
  @$pb.TagNumber(5)
  void clearCountryCode() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get countryFlag => $_getSZ(5);
  @$pb.TagNumber(6)
  set countryFlag($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCountryFlag() => $_has(5);
  @$pb.TagNumber(6)
  void clearCountryFlag() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get currencyName => $_getSZ(6);
  @$pb.TagNumber(7)
  set currencyName($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCurrencyName() => $_has(6);
  @$pb.TagNumber(7)
  void clearCurrencyName() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get currencyCode => $_getSZ(7);
  @$pb.TagNumber(8)
  set currencyCode($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasCurrencyCode() => $_has(7);
  @$pb.TagNumber(8)
  void clearCurrencyCode() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get remittanceRate => $_getSZ(8);
  @$pb.TagNumber(9)
  set remittanceRate($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasRemittanceRate() => $_has(8);
  @$pb.TagNumber(9)
  void clearRemittanceRate() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get remittanceCharge => $_getSZ(9);
  @$pb.TagNumber(10)
  set remittanceCharge($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasRemittanceCharge() => $_has(9);
  @$pb.TagNumber(10)
  void clearRemittanceCharge() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get forexBuyRate => $_getSZ(10);
  @$pb.TagNumber(11)
  set forexBuyRate($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasForexBuyRate() => $_has(10);
  @$pb.TagNumber(11)
  void clearForexBuyRate() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get forexSellRate => $_getSZ(11);
  @$pb.TagNumber(12)
  set forexSellRate($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasForexSellRate() => $_has(11);
  @$pb.TagNumber(12)
  void clearForexSellRate() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get forexBuyCharge => $_getSZ(12);
  @$pb.TagNumber(13)
  set forexBuyCharge($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasForexBuyCharge() => $_has(12);
  @$pb.TagNumber(13)
  void clearForexBuyCharge() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get forexSellCharge => $_getSZ(13);
  @$pb.TagNumber(14)
  set forexSellCharge($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasForexSellCharge() => $_has(13);
  @$pb.TagNumber(14)
  void clearForexSellCharge() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get priorityCurrency => $_getSZ(14);
  @$pb.TagNumber(15)
  set priorityCurrency($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasPriorityCurrency() => $_has(14);
  @$pb.TagNumber(15)
  void clearPriorityCurrency() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get lastModifiedUserId => $_getSZ(15);
  @$pb.TagNumber(16)
  set lastModifiedUserId($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasLastModifiedUserId() => $_has(15);
  @$pb.TagNumber(16)
  void clearLastModifiedUserId() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get lastModifiedUserName => $_getSZ(16);
  @$pb.TagNumber(17)
  set lastModifiedUserName($core.String v) { $_setString(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasLastModifiedUserName() => $_has(16);
  @$pb.TagNumber(17)
  void clearLastModifiedUserName() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get lastModifiedDate => $_getSZ(17);
  @$pb.TagNumber(18)
  set lastModifiedDate($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasLastModifiedDate() => $_has(17);
  @$pb.TagNumber(18)
  void clearLastModifiedDate() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get lastModifiedTime => $_getSZ(18);
  @$pb.TagNumber(19)
  set lastModifiedTime($core.String v) { $_setString(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasLastModifiedTime() => $_has(18);
  @$pb.TagNumber(19)
  void clearLastModifiedTime() => clearField(19);

  @$pb.TagNumber(20)
  $fixnum.Int64 get active => $_getI64(19);
  @$pb.TagNumber(20)
  set active($fixnum.Int64 v) { $_setInt64(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasActive() => $_has(19);
  @$pb.TagNumber(20)
  void clearActive() => clearField(20);
}

class Banner extends $pb.GeneratedMessage {
  factory Banner({
    $core.String? tickerBannerDescription,
    $core.String? offerDescription,
    $core.String? adImageUrl,
  }) {
    final $result = create();
    if (tickerBannerDescription != null) {
      $result.tickerBannerDescription = tickerBannerDescription;
    }
    if (offerDescription != null) {
      $result.offerDescription = offerDescription;
    }
    if (adImageUrl != null) {
      $result.adImageUrl = adImageUrl;
    }
    return $result;
  }
  Banner._() : super();
  factory Banner.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Banner.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Banner', package: const $pb.PackageName(_omitMessageNames ? '' : 'exchangerate'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'TickerBannerDescription', protoName: 'TickerBannerDescription')
    ..aOS(2, _omitFieldNames ? '' : 'OfferDescription', protoName: 'OfferDescription')
    ..aOS(3, _omitFieldNames ? '' : 'AdImageUrl', protoName: 'AdImageUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Banner clone() => Banner()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Banner copyWith(void Function(Banner) updates) => super.copyWith((message) => updates(message as Banner)) as Banner;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Banner create() => Banner._();
  Banner createEmptyInstance() => create();
  static $pb.PbList<Banner> createRepeated() => $pb.PbList<Banner>();
  @$core.pragma('dart2js:noInline')
  static Banner getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Banner>(create);
  static Banner? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tickerBannerDescription => $_getSZ(0);
  @$pb.TagNumber(1)
  set tickerBannerDescription($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTickerBannerDescription() => $_has(0);
  @$pb.TagNumber(1)
  void clearTickerBannerDescription() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get offerDescription => $_getSZ(1);
  @$pb.TagNumber(2)
  set offerDescription($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOfferDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearOfferDescription() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get adImageUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set adImageUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAdImageUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearAdImageUrl() => clearField(3);
}

class Response extends $pb.GeneratedMessage {
  factory Response({
    $core.bool? result,
    $core.String? id,
    $core.String? responseStatus,
    $core.String? responseData,
    $core.String? responseCode,
    $core.String? lastModifiedDate,
    $core.String? lastModifiedTime,
    $core.String? branchCode,
    $core.String? branchName,
  }) {
    final $result = create();
    if (result != null) {
      $result.result = result;
    }
    if (id != null) {
      $result.id = id;
    }
    if (responseStatus != null) {
      $result.responseStatus = responseStatus;
    }
    if (responseData != null) {
      $result.responseData = responseData;
    }
    if (responseCode != null) {
      $result.responseCode = responseCode;
    }
    if (lastModifiedDate != null) {
      $result.lastModifiedDate = lastModifiedDate;
    }
    if (lastModifiedTime != null) {
      $result.lastModifiedTime = lastModifiedTime;
    }
    if (branchCode != null) {
      $result.branchCode = branchCode;
    }
    if (branchName != null) {
      $result.branchName = branchName;
    }
    return $result;
  }
  Response._() : super();
  factory Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Response', package: const $pb.PackageName(_omitMessageNames ? '' : 'exchangerate'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'Result', protoName: 'Result')
    ..aOS(2, _omitFieldNames ? '' : 'Id', protoName: 'Id')
    ..aOS(3, _omitFieldNames ? '' : 'ResponseStatus', protoName: 'ResponseStatus')
    ..aOS(4, _omitFieldNames ? '' : 'ResponseData', protoName: 'ResponseData')
    ..aOS(5, _omitFieldNames ? '' : 'ResponseCode', protoName: 'ResponseCode')
    ..aOS(6, _omitFieldNames ? '' : 'LastModifiedDate', protoName: 'LastModifiedDate')
    ..aOS(7, _omitFieldNames ? '' : 'LastModifiedTime', protoName: 'LastModifiedTime')
    ..aOS(8, _omitFieldNames ? '' : 'BranchCode', protoName: 'BranchCode')
    ..aOS(9, _omitFieldNames ? '' : 'BranchName', protoName: 'BranchName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Response clone() => Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Response copyWith(void Function(Response) updates) => super.copyWith((message) => updates(message as Response)) as Response;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Response create() => Response._();
  Response createEmptyInstance() => create();
  static $pb.PbList<Response> createRepeated() => $pb.PbList<Response>();
  @$core.pragma('dart2js:noInline')
  static Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Response>(create);
  static Response? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get result => $_getBF(0);
  @$pb.TagNumber(1)
  set result($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get responseStatus => $_getSZ(2);
  @$pb.TagNumber(3)
  set responseStatus($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasResponseStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearResponseStatus() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get responseData => $_getSZ(3);
  @$pb.TagNumber(4)
  set responseData($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasResponseData() => $_has(3);
  @$pb.TagNumber(4)
  void clearResponseData() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get responseCode => $_getSZ(4);
  @$pb.TagNumber(5)
  set responseCode($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasResponseCode() => $_has(4);
  @$pb.TagNumber(5)
  void clearResponseCode() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get lastModifiedDate => $_getSZ(5);
  @$pb.TagNumber(6)
  set lastModifiedDate($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLastModifiedDate() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastModifiedDate() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get lastModifiedTime => $_getSZ(6);
  @$pb.TagNumber(7)
  set lastModifiedTime($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLastModifiedTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearLastModifiedTime() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get branchCode => $_getSZ(7);
  @$pb.TagNumber(8)
  set branchCode($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasBranchCode() => $_has(7);
  @$pb.TagNumber(8)
  void clearBranchCode() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get branchName => $_getSZ(8);
  @$pb.TagNumber(9)
  set branchName($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasBranchName() => $_has(8);
  @$pb.TagNumber(9)
  void clearBranchName() => clearField(9);
}

class GetReq extends $pb.GeneratedMessage {
  factory GetReq({
    $core.String? latitude,
    $core.String? longitude,
    $core.String? branchCode,
  }) {
    final $result = create();
    if (latitude != null) {
      $result.latitude = latitude;
    }
    if (longitude != null) {
      $result.longitude = longitude;
    }
    if (branchCode != null) {
      $result.branchCode = branchCode;
    }
    return $result;
  }
  GetReq._() : super();
  factory GetReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'exchangerate'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Latitude', protoName: 'Latitude')
    ..aOS(2, _omitFieldNames ? '' : 'Longitude', protoName: 'Longitude')
    ..aOS(3, _omitFieldNames ? '' : 'BranchCode', protoName: 'BranchCode')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetReq clone() => GetReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetReq copyWith(void Function(GetReq) updates) => super.copyWith((message) => updates(message as GetReq)) as GetReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetReq create() => GetReq._();
  GetReq createEmptyInstance() => create();
  static $pb.PbList<GetReq> createRepeated() => $pb.PbList<GetReq>();
  @$core.pragma('dart2js:noInline')
  static GetReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetReq>(create);
  static GetReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get latitude => $_getSZ(0);
  @$pb.TagNumber(1)
  set latitude($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLatitude() => $_has(0);
  @$pb.TagNumber(1)
  void clearLatitude() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get longitude => $_getSZ(1);
  @$pb.TagNumber(2)
  set longitude($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLongitude() => $_has(1);
  @$pb.TagNumber(2)
  void clearLongitude() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get branchCode => $_getSZ(2);
  @$pb.TagNumber(3)
  set branchCode($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBranchCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearBranchCode() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
