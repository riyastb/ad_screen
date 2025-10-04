//
//  Generated code. Do not modify.
//  source: exchangerate.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use rateReqDescriptor instead')
const RateReq$json = {
  '1': 'RateReq',
  '2': [
    {'1': 'Payload', '3': 1, '4': 3, '5': 11, '6': '.exchangerate.Payload', '10': 'Payload'},
  ],
};

/// Descriptor for `RateReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rateReqDescriptor = $convert.base64Decode(
    'CgdSYXRlUmVxEi8KB1BheWxvYWQYASADKAsyFS5leGNoYW5nZXJhdGUuUGF5bG9hZFIHUGF5bG'
    '9hZA==');

@$core.Deprecated('Use rateDataDescriptor instead')
const RateData$json = {
  '1': 'RateData',
  '2': [
    {'1': 'Payload', '3': 1, '4': 3, '5': 11, '6': '.exchangerate.Payload', '10': 'Payload'},
    {'1': 'TickerBannerDescription', '3': 2, '4': 1, '5': 9, '10': 'TickerBannerDescription'},
    {'1': 'OfferDescription', '3': 3, '4': 1, '5': 9, '10': 'OfferDescription'},
    {'1': 'AdImageUrl', '3': 4, '4': 1, '5': 9, '10': 'AdImageUrl'},
  ],
};

/// Descriptor for `RateData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rateDataDescriptor = $convert.base64Decode(
    'CghSYXRlRGF0YRIvCgdQYXlsb2FkGAEgAygLMhUuZXhjaGFuZ2VyYXRlLlBheWxvYWRSB1BheW'
    'xvYWQSOAoXVGlja2VyQmFubmVyRGVzY3JpcHRpb24YAiABKAlSF1RpY2tlckJhbm5lckRlc2Ny'
    'aXB0aW9uEioKEE9mZmVyRGVzY3JpcHRpb24YAyABKAlSEE9mZmVyRGVzY3JpcHRpb24SHgoKQW'
    'RJbWFnZVVybBgEIAEoCVIKQWRJbWFnZVVybA==');

@$core.Deprecated('Use payloadDescriptor instead')
const Payload$json = {
  '1': 'Payload',
  '2': [
    {'1': 'Id', '3': 1, '4': 1, '5': 9, '10': 'Id'},
    {'1': 'BranchName', '3': 2, '4': 1, '5': 9, '10': 'BranchName'},
    {'1': 'BranchCode', '3': 3, '4': 1, '5': 9, '10': 'BranchCode'},
    {'1': 'CountryName', '3': 4, '4': 1, '5': 9, '10': 'CountryName'},
    {'1': 'CountryCode', '3': 5, '4': 1, '5': 9, '10': 'CountryCode'},
    {'1': 'CountryFlag', '3': 6, '4': 1, '5': 9, '10': 'CountryFlag'},
    {'1': 'CurrencyName', '3': 7, '4': 1, '5': 9, '10': 'CurrencyName'},
    {'1': 'CurrencyCode', '3': 8, '4': 1, '5': 9, '10': 'CurrencyCode'},
    {'1': 'RemittanceRate', '3': 9, '4': 1, '5': 9, '10': 'RemittanceRate'},
    {'1': 'RemittanceCharge', '3': 10, '4': 1, '5': 9, '10': 'RemittanceCharge'},
    {'1': 'ForexBuyRate', '3': 11, '4': 1, '5': 9, '10': 'ForexBuyRate'},
    {'1': 'ForexSellRate', '3': 12, '4': 1, '5': 9, '10': 'ForexSellRate'},
    {'1': 'ForexBuyCharge', '3': 13, '4': 1, '5': 9, '10': 'ForexBuyCharge'},
    {'1': 'ForexSellCharge', '3': 14, '4': 1, '5': 9, '10': 'ForexSellCharge'},
    {'1': 'PriorityCurrency', '3': 15, '4': 1, '5': 9, '10': 'PriorityCurrency'},
    {'1': 'LastModifiedUserId', '3': 16, '4': 1, '5': 9, '10': 'LastModifiedUserId'},
    {'1': 'LastModifiedUserName', '3': 17, '4': 1, '5': 9, '10': 'LastModifiedUserName'},
    {'1': 'LastModifiedDate', '3': 18, '4': 1, '5': 9, '10': 'LastModifiedDate'},
    {'1': 'LastModifiedTime', '3': 19, '4': 1, '5': 9, '10': 'LastModifiedTime'},
    {'1': 'Active', '3': 20, '4': 1, '5': 3, '10': 'Active'},
  ],
};

/// Descriptor for `Payload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List payloadDescriptor = $convert.base64Decode(
    'CgdQYXlsb2FkEg4KAklkGAEgASgJUgJJZBIeCgpCcmFuY2hOYW1lGAIgASgJUgpCcmFuY2hOYW'
    '1lEh4KCkJyYW5jaENvZGUYAyABKAlSCkJyYW5jaENvZGUSIAoLQ291bnRyeU5hbWUYBCABKAlS'
    'C0NvdW50cnlOYW1lEiAKC0NvdW50cnlDb2RlGAUgASgJUgtDb3VudHJ5Q29kZRIgCgtDb3VudH'
    'J5RmxhZxgGIAEoCVILQ291bnRyeUZsYWcSIgoMQ3VycmVuY3lOYW1lGAcgASgJUgxDdXJyZW5j'
    'eU5hbWUSIgoMQ3VycmVuY3lDb2RlGAggASgJUgxDdXJyZW5jeUNvZGUSJgoOUmVtaXR0YW5jZV'
    'JhdGUYCSABKAlSDlJlbWl0dGFuY2VSYXRlEioKEFJlbWl0dGFuY2VDaGFyZ2UYCiABKAlSEFJl'
    'bWl0dGFuY2VDaGFyZ2USIgoMRm9yZXhCdXlSYXRlGAsgASgJUgxGb3JleEJ1eVJhdGUSJAoNRm'
    '9yZXhTZWxsUmF0ZRgMIAEoCVINRm9yZXhTZWxsUmF0ZRImCg5Gb3JleEJ1eUNoYXJnZRgNIAEo'
    'CVIORm9yZXhCdXlDaGFyZ2USKAoPRm9yZXhTZWxsQ2hhcmdlGA4gASgJUg9Gb3JleFNlbGxDaG'
    'FyZ2USKgoQUHJpb3JpdHlDdXJyZW5jeRgPIAEoCVIQUHJpb3JpdHlDdXJyZW5jeRIuChJMYXN0'
    'TW9kaWZpZWRVc2VySWQYECABKAlSEkxhc3RNb2RpZmllZFVzZXJJZBIyChRMYXN0TW9kaWZpZW'
    'RVc2VyTmFtZRgRIAEoCVIUTGFzdE1vZGlmaWVkVXNlck5hbWUSKgoQTGFzdE1vZGlmaWVkRGF0'
    'ZRgSIAEoCVIQTGFzdE1vZGlmaWVkRGF0ZRIqChBMYXN0TW9kaWZpZWRUaW1lGBMgASgJUhBMYX'
    'N0TW9kaWZpZWRUaW1lEhYKBkFjdGl2ZRgUIAEoA1IGQWN0aXZl');

@$core.Deprecated('Use bannerDescriptor instead')
const Banner$json = {
  '1': 'Banner',
  '2': [
    {'1': 'TickerBannerDescription', '3': 1, '4': 1, '5': 9, '10': 'TickerBannerDescription'},
    {'1': 'OfferDescription', '3': 2, '4': 1, '5': 9, '10': 'OfferDescription'},
    {'1': 'AdImageUrl', '3': 3, '4': 1, '5': 9, '10': 'AdImageUrl'},
  ],
};

/// Descriptor for `Banner`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bannerDescriptor = $convert.base64Decode(
    'CgZCYW5uZXISOAoXVGlja2VyQmFubmVyRGVzY3JpcHRpb24YASABKAlSF1RpY2tlckJhbm5lck'
    'Rlc2NyaXB0aW9uEioKEE9mZmVyRGVzY3JpcHRpb24YAiABKAlSEE9mZmVyRGVzY3JpcHRpb24S'
    'HgoKQWRJbWFnZVVybBgDIAEoCVIKQWRJbWFnZVVybA==');

@$core.Deprecated('Use responseDescriptor instead')
const Response$json = {
  '1': 'Response',
  '2': [
    {'1': 'Result', '3': 1, '4': 1, '5': 8, '10': 'Result'},
    {'1': 'Id', '3': 2, '4': 1, '5': 9, '10': 'Id'},
    {'1': 'ResponseStatus', '3': 3, '4': 1, '5': 9, '10': 'ResponseStatus'},
    {'1': 'ResponseData', '3': 4, '4': 1, '5': 9, '10': 'ResponseData'},
    {'1': 'ResponseCode', '3': 5, '4': 1, '5': 9, '10': 'ResponseCode'},
    {'1': 'LastModifiedDate', '3': 6, '4': 1, '5': 9, '10': 'LastModifiedDate'},
    {'1': 'LastModifiedTime', '3': 7, '4': 1, '5': 9, '10': 'LastModifiedTime'},
    {'1': 'BranchCode', '3': 8, '4': 1, '5': 9, '10': 'BranchCode'},
    {'1': 'BranchName', '3': 9, '4': 1, '5': 9, '10': 'BranchName'},
  ],
};

/// Descriptor for `Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseDescriptor = $convert.base64Decode(
    'CghSZXNwb25zZRIWCgZSZXN1bHQYASABKAhSBlJlc3VsdBIOCgJJZBgCIAEoCVICSWQSJgoOUm'
    'VzcG9uc2VTdGF0dXMYAyABKAlSDlJlc3BvbnNlU3RhdHVzEiIKDFJlc3BvbnNlRGF0YRgEIAEo'
    'CVIMUmVzcG9uc2VEYXRhEiIKDFJlc3BvbnNlQ29kZRgFIAEoCVIMUmVzcG9uc2VDb2RlEioKEE'
    'xhc3RNb2RpZmllZERhdGUYBiABKAlSEExhc3RNb2RpZmllZERhdGUSKgoQTGFzdE1vZGlmaWVk'
    'VGltZRgHIAEoCVIQTGFzdE1vZGlmaWVkVGltZRIeCgpCcmFuY2hDb2RlGAggASgJUgpCcmFuY2'
    'hDb2RlEh4KCkJyYW5jaE5hbWUYCSABKAlSCkJyYW5jaE5hbWU=');

@$core.Deprecated('Use getReqDescriptor instead')
const GetReq$json = {
  '1': 'GetReq',
  '2': [
    {'1': 'Latitude', '3': 1, '4': 1, '5': 9, '10': 'Latitude'},
    {'1': 'Longitude', '3': 2, '4': 1, '5': 9, '10': 'Longitude'},
    {'1': 'BranchCode', '3': 3, '4': 1, '5': 9, '10': 'BranchCode'},
  ],
};

/// Descriptor for `GetReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getReqDescriptor = $convert.base64Decode(
    'CgZHZXRSZXESGgoITGF0aXR1ZGUYASABKAlSCExhdGl0dWRlEhwKCUxvbmdpdHVkZRgCIAEoCV'
    'IJTG9uZ2l0dWRlEh4KCkJyYW5jaENvZGUYAyABKAlSCkJyYW5jaENvZGU=');

