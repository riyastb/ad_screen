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
    {'1': 'BBColor', '3': 3, '4': 1, '5': 9, '10': 'BBColor'},
    {'1': 'BranchNameTextColor', '3': 4, '4': 1, '5': 9, '10': 'BranchNameTextColor'},
    {'1': 'TransferRateTextColor', '3': 5, '4': 1, '5': 9, '10': 'TransferRateTextColor'},
    {'1': 'SellRateTextColor', '3': 6, '4': 1, '5': 9, '10': 'SellRateTextColor'},
    {'1': 'FooterBgColor', '3': 7, '4': 1, '5': 9, '10': 'FooterBgColor'},
    {'1': 'RateCardBgColor', '3': 8, '4': 1, '5': 9, '10': 'RateCardBgColor'},
    {'1': 'ClockTextColor', '3': 9, '4': 1, '5': 9, '10': 'ClockTextColor'},
    {'1': 'CalenderTextColor', '3': 10, '4': 1, '5': 9, '10': 'CalenderTextColor'},
    {'1': 'CurrencyTextColor', '3': 11, '4': 1, '5': 9, '10': 'CurrencyTextColor'},
    {'1': 'BuyRateTextColor', '3': 12, '4': 1, '5': 9, '10': 'BuyRateTextColor'},
    {'1': 'FooterTextColor', '3': 13, '4': 1, '5': 9, '10': 'FooterTextColor'},
    {'1': 'HeaderBBColor', '3': 14, '4': 1, '5': 9, '10': 'HeaderBBColor'},
    {'1': 'OfferDescription', '3': 15, '4': 1, '5': 9, '10': 'OfferDescription'},
    {'1': 'Fonts', '3': 16, '4': 1, '5': 11, '6': '.exchangerate.Fonts', '10': 'Fonts'},
  ],
};

/// Descriptor for `RateData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rateDataDescriptor = $convert.base64Decode(
    'CghSYXRlRGF0YRIvCgdQYXlsb2FkGAEgAygLMhUuZXhjaGFuZ2VyYXRlLlBheWxvYWRSB1BheW'
    'xvYWQSOAoXVGlja2VyQmFubmVyRGVzY3JpcHRpb24YAiABKAlSF1RpY2tlckJhbm5lckRlc2Ny'
    'aXB0aW9uEhgKB0JCQ29sb3IYAyABKAlSB0JCQ29sb3ISMAoTQnJhbmNoTmFtZVRleHRDb2xvch'
    'gEIAEoCVITQnJhbmNoTmFtZVRleHRDb2xvchI0ChVUcmFuc2ZlclJhdGVUZXh0Q29sb3IYBSAB'
    'KAlSFVRyYW5zZmVyUmF0ZVRleHRDb2xvchIsChFTZWxsUmF0ZVRleHRDb2xvchgGIAEoCVIRU2'
    'VsbFJhdGVUZXh0Q29sb3ISJAoNRm9vdGVyQmdDb2xvchgHIAEoCVINRm9vdGVyQmdDb2xvchIo'
    'Cg9SYXRlQ2FyZEJnQ29sb3IYCCABKAlSD1JhdGVDYXJkQmdDb2xvchImCg5DbG9ja1RleHRDb2'
    'xvchgJIAEoCVIOQ2xvY2tUZXh0Q29sb3ISLAoRQ2FsZW5kZXJUZXh0Q29sb3IYCiABKAlSEUNh'
    'bGVuZGVyVGV4dENvbG9yEiwKEUN1cnJlbmN5VGV4dENvbG9yGAsgASgJUhFDdXJyZW5jeVRleH'
    'RDb2xvchIqChBCdXlSYXRlVGV4dENvbG9yGAwgASgJUhBCdXlSYXRlVGV4dENvbG9yEigKD0Zv'
    'b3RlclRleHRDb2xvchgNIAEoCVIPRm9vdGVyVGV4dENvbG9yEiQKDUhlYWRlckJCQ29sb3IYDi'
    'ABKAlSDUhlYWRlckJCQ29sb3ISKgoQT2ZmZXJEZXNjcmlwdGlvbhgPIAEoCVIQT2ZmZXJEZXNj'
    'cmlwdGlvbhIpCgVGb250cxgQIAEoCzITLmV4Y2hhbmdlcmF0ZS5Gb250c1IFRm9udHM=');

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
    {'1': 'BBColor', '3': 3, '4': 1, '5': 9, '10': 'BBColor'},
    {'1': 'BranchNameTextColor', '3': 4, '4': 1, '5': 9, '10': 'BranchNameTextColor'},
    {'1': 'TransferRateTextColor', '3': 5, '4': 1, '5': 9, '10': 'TransferRateTextColor'},
    {'1': 'SellRateTextColor', '3': 6, '4': 1, '5': 9, '10': 'SellRateTextColor'},
    {'1': 'FooterBgColor', '3': 7, '4': 1, '5': 9, '10': 'FooterBgColor'},
    {'1': 'RateCardBgColor', '3': 8, '4': 1, '5': 9, '10': 'RateCardBgColor'},
    {'1': 'ClockTextColor', '3': 9, '4': 1, '5': 9, '10': 'ClockTextColor'},
    {'1': 'CalenderTextColor', '3': 10, '4': 1, '5': 9, '10': 'CalenderTextColor'},
    {'1': 'CurrencyTextColor', '3': 11, '4': 1, '5': 9, '10': 'CurrencyTextColor'},
    {'1': 'BuyRateTextColor', '3': 12, '4': 1, '5': 9, '10': 'BuyRateTextColor'},
    {'1': 'FooterTextColor', '3': 13, '4': 1, '5': 9, '10': 'FooterTextColor'},
    {'1': 'HeaderBBColor', '3': 14, '4': 1, '5': 9, '10': 'HeaderBBColor'},
    {'1': 'BranchCode', '3': 15, '4': 1, '5': 9, '10': 'BranchCode'},
    {'1': 'Fonts', '3': 16, '4': 1, '5': 11, '6': '.exchangerate.Fonts', '10': 'Fonts'},
  ],
};

/// Descriptor for `Banner`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bannerDescriptor = $convert.base64Decode(
    'CgZCYW5uZXISOAoXVGlja2VyQmFubmVyRGVzY3JpcHRpb24YASABKAlSF1RpY2tlckJhbm5lck'
    'Rlc2NyaXB0aW9uEioKEE9mZmVyRGVzY3JpcHRpb24YAiABKAlSEE9mZmVyRGVzY3JpcHRpb24S'
    'GAoHQkJDb2xvchgDIAEoCVIHQkJDb2xvchIwChNCcmFuY2hOYW1lVGV4dENvbG9yGAQgASgJUh'
    'NCcmFuY2hOYW1lVGV4dENvbG9yEjQKFVRyYW5zZmVyUmF0ZVRleHRDb2xvchgFIAEoCVIVVHJh'
    'bnNmZXJSYXRlVGV4dENvbG9yEiwKEVNlbGxSYXRlVGV4dENvbG9yGAYgASgJUhFTZWxsUmF0ZV'
    'RleHRDb2xvchIkCg1Gb290ZXJCZ0NvbG9yGAcgASgJUg1Gb290ZXJCZ0NvbG9yEigKD1JhdGVD'
    'YXJkQmdDb2xvchgIIAEoCVIPUmF0ZUNhcmRCZ0NvbG9yEiYKDkNsb2NrVGV4dENvbG9yGAkgAS'
    'gJUg5DbG9ja1RleHRDb2xvchIsChFDYWxlbmRlclRleHRDb2xvchgKIAEoCVIRQ2FsZW5kZXJU'
    'ZXh0Q29sb3ISLAoRQ3VycmVuY3lUZXh0Q29sb3IYCyABKAlSEUN1cnJlbmN5VGV4dENvbG9yEi'
    'oKEEJ1eVJhdGVUZXh0Q29sb3IYDCABKAlSEEJ1eVJhdGVUZXh0Q29sb3ISKAoPRm9vdGVyVGV4'
    'dENvbG9yGA0gASgJUg9Gb290ZXJUZXh0Q29sb3ISJAoNSGVhZGVyQkJDb2xvchgOIAEoCVINSG'
    'VhZGVyQkJDb2xvchIeCgpCcmFuY2hDb2RlGA8gASgJUgpCcmFuY2hDb2RlEikKBUZvbnRzGBAg'
    'ASgLMhMuZXhjaGFuZ2VyYXRlLkZvbnRzUgVGb250cw==');

@$core.Deprecated('Use fontsDescriptor instead')
const Fonts$json = {
  '1': 'Fonts',
  '2': [
    {'1': 'BranchNameFontSize', '3': 1, '4': 1, '5': 9, '10': 'BranchNameFontSize'},
    {'1': 'DateFontSize', '3': 2, '4': 1, '5': 9, '10': 'DateFontSize'},
    {'1': 'TimeFontSize', '3': 3, '4': 1, '5': 9, '10': 'TimeFontSize'},
    {'1': 'ScrollFooterFontSize', '3': 4, '4': 1, '5': 9, '10': 'ScrollFooterFontSize'},
    {'1': 'RatesFontSize', '3': 5, '4': 1, '5': 9, '10': 'RatesFontSize'},
  ],
};

/// Descriptor for `Fonts`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fontsDescriptor = $convert.base64Decode(
    'CgVGb250cxIuChJCcmFuY2hOYW1lRm9udFNpemUYASABKAlSEkJyYW5jaE5hbWVGb250U2l6ZR'
    'IiCgxEYXRlRm9udFNpemUYAiABKAlSDERhdGVGb250U2l6ZRIiCgxUaW1lRm9udFNpemUYAyAB'
    'KAlSDFRpbWVGb250U2l6ZRIyChRTY3JvbGxGb290ZXJGb250U2l6ZRgEIAEoCVIUU2Nyb2xsRm'
    '9vdGVyRm9udFNpemUSJAoNUmF0ZXNGb250U2l6ZRgFIAEoCVINUmF0ZXNGb250U2l6ZQ==');

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
    {'1': 'ImagePath', '3': 10, '4': 1, '5': 9, '10': 'ImagePath'},
  ],
};

/// Descriptor for `Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseDescriptor = $convert.base64Decode(
    'CghSZXNwb25zZRIWCgZSZXN1bHQYASABKAhSBlJlc3VsdBIOCgJJZBgCIAEoCVICSWQSJgoOUm'
    'VzcG9uc2VTdGF0dXMYAyABKAlSDlJlc3BvbnNlU3RhdHVzEiIKDFJlc3BvbnNlRGF0YRgEIAEo'
    'CVIMUmVzcG9uc2VEYXRhEiIKDFJlc3BvbnNlQ29kZRgFIAEoCVIMUmVzcG9uc2VDb2RlEioKEE'
    'xhc3RNb2RpZmllZERhdGUYBiABKAlSEExhc3RNb2RpZmllZERhdGUSKgoQTGFzdE1vZGlmaWVk'
    'VGltZRgHIAEoCVIQTGFzdE1vZGlmaWVkVGltZRIeCgpCcmFuY2hDb2RlGAggASgJUgpCcmFuY2'
    'hDb2RlEh4KCkJyYW5jaE5hbWUYCSABKAlSCkJyYW5jaE5hbWUSHAoJSW1hZ2VQYXRoGAogASgJ'
    'UglJbWFnZVBhdGg=');

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

@$core.Deprecated('Use imageDataDescriptor instead')
const ImageData$json = {
  '1': 'ImageData',
  '2': [
    {'1': 'info', '3': 1, '4': 1, '5': 11, '6': '.exchangerate.ImageInfo', '10': 'info'},
    {'1': 'chunk_data', '3': 2, '4': 1, '5': 12, '10': 'chunkData'},
  ],
};

/// Descriptor for `ImageData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageDataDescriptor = $convert.base64Decode(
    'CglJbWFnZURhdGESKwoEaW5mbxgBIAEoCzIXLmV4Y2hhbmdlcmF0ZS5JbWFnZUluZm9SBGluZm'
    '8SHQoKY2h1bmtfZGF0YRgCIAEoDFIJY2h1bmtEYXRh');

@$core.Deprecated('Use imageInfoDescriptor instead')
const ImageInfo$json = {
  '1': 'ImageInfo',
  '2': [
    {'1': 'Id', '3': 1, '4': 1, '5': 9, '10': 'Id'},
    {'1': 'ImageID', '3': 2, '4': 1, '5': 9, '10': 'ImageID'},
    {'1': 'ImageType', '3': 3, '4': 1, '5': 9, '10': 'ImageType'},
    {'1': 'BranchCode', '3': 4, '4': 1, '5': 9, '10': 'BranchCode'},
  ],
};

/// Descriptor for `ImageInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageInfoDescriptor = $convert.base64Decode(
    'CglJbWFnZUluZm8SDgoCSWQYASABKAlSAklkEhgKB0ltYWdlSUQYAiABKAlSB0ltYWdlSUQSHA'
    'oJSW1hZ2VUeXBlGAMgASgJUglJbWFnZVR5cGUSHgoKQnJhbmNoQ29kZRgEIAEoCVIKQnJhbmNo'
    'Q29kZQ==');

@$core.Deprecated('Use imageReqDescriptor instead')
const ImageReq$json = {
  '1': 'ImageReq',
  '2': [
    {'1': 'Id', '3': 1, '4': 1, '5': 9, '10': 'Id'},
    {'1': 'ImageId', '3': 2, '4': 1, '5': 9, '10': 'ImageId'},
    {'1': 'BranchCode', '3': 3, '4': 1, '5': 9, '10': 'BranchCode'},
  ],
};

/// Descriptor for `ImageReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageReqDescriptor = $convert.base64Decode(
    'CghJbWFnZVJlcRIOCgJJZBgBIAEoCVICSWQSGAoHSW1hZ2VJZBgCIAEoCVIHSW1hZ2VJZBIeCg'
    'pCcmFuY2hDb2RlGAMgASgJUgpCcmFuY2hDb2Rl');

