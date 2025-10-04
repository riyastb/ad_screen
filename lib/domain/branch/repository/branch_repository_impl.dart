import 'dart:async';
import 'package:logger/logger.dart';
import '../../../core/logger/app_logger.dart';

import 'package:grpc/grpc.dart';

import '../model/exchangerate.pbgrpc.dart';
import '../model/branch.dart';
import '../model/location_request.dart';
import 'branch_repository.dart';

class BranchRepositoryImpl implements BranchRepository {
  late ClientChannel _channel;
  late ExchangeRateServiceClient _client;
  final Logger _logger = AppLogger.createLogger('BranchRepository');
  
  BranchRepositoryImpl({String? host, int? port}) {
    final serverHost = host ?? 'ratecontrol2.uat.lariexchange.com';
    final serverPort = port ?? 443;
    
    _logger.i('🔧 Initializing gRPC connection to $serverHost:$serverPort');
    
    _channel = ClientChannel(
      serverHost,
      port: serverPort,
      options: const ChannelOptions(
        // Use TLS for port 443
        credentials: ChannelCredentials.secure(),
      ),
    );
    _client = ExchangeRateServiceClient(_channel);
    
    _logger.i('✅ gRPC client initialized successfully');
  }

  @override
  Future<List<Branch>> getAllBranchByLongitudeAndLatitude(LocationRequest request) async {
    try {
      final getReq = GetReq()
        ..latitude = request.latitude
        ..longitude = request.longitude;
      
      if (request.branchCode != null) {
        getReq.branchCode = request.branchCode!;
      }

      // Log detailed gRPC request
      _logger.i('🚀 Making gRPC call: getAllBranchByLongitudeAndLatitude');
      AppLogger.logObject('gRPC Request (GetReq)', {
        'latitude': getReq.latitude,
        'longitude': getReq.longitude,
        'branchCode': getReq.branchCode,
      }, _logger);

      // Attach required metadata
      final metadata = {'Action': 'NA'};
      AppLogger.logObject('gRPC Metadata', metadata, _logger);

      // Unary call now returns RateData (with payload list + banner fields)
      final rateData = await _client.getBranchRateByLongitudeAndLatitude(
        getReq,
        options: CallOptions(metadata: metadata),
      );

      // Log banner/meta info
      AppLogger.logObject('gRPC Response (RateData)', {
        'tickerBannerDescription': rateData.tickerBannerDescription,
        'offerDescription': rateData.offerDescription,
        'adImageUrl': rateData.adImageUrl,
        'payloadLength': rateData.payload.length,
      }, _logger);

      final List<Branch> branches = [];
      int payloadCount = 0;

      for (final payload in rateData.payload) {
        payloadCount++;
        // Log each payload in detail
        AppLogger.logObject('Payload #$payloadCount', {
          'id': payload.id,
          'branchName': payload.branchName,
          'branchCode': payload.branchCode,
          'countryName': payload.countryName,
          'countryCode': payload.countryCode,
          'countryFlag': payload.countryFlag,
          'currencyName': payload.currencyName,
          'currencyCode': payload.currencyCode,
          'remittanceRate': payload.remittanceRate,
          'remittanceCharge': payload.remittanceCharge,
          'forexBuyRate': payload.forexBuyRate,
          'forexSellRate': payload.forexSellRate,
          'forexBuyCharge': payload.forexBuyCharge,
          'forexSellCharge': payload.forexSellCharge,
          'priorityCurrency': payload.priorityCurrency,
          'lastModifiedUserId': payload.lastModifiedUserId,
          'lastModifiedUserName': payload.lastModifiedUserName,
          'lastModifiedDate': payload.lastModifiedDate,
          'lastModifiedTime': payload.lastModifiedTime,
          'active': payload.active,
        }, _logger);

        final branch = Branch(
          id: payload.id,
          branchName: payload.branchName,
          branchCode: payload.branchCode,
          latitude: request.latitude, // Using request latitude as branch location
          longitude: request.longitude, // Using request longitude as branch location
          address: '${payload.branchName} - ${payload.branchCode}',
          active: payload.active.toInt() == 1,
          lastModifiedDate: payload.lastModifiedDate,
          lastModifiedTime: payload.lastModifiedTime,
          countryName: payload.countryName,
          countryCode: payload.countryCode,
          countryFlag: payload.countryFlag,
          currencyName: payload.currencyName,
          currencyCode: payload.currencyCode,
          remittanceRate: double.tryParse(payload.remittanceRate),
          remittanceCharge: double.tryParse(payload.remittanceCharge),
          forexBuyRate: double.tryParse(payload.forexBuyRate),
          forexSellRate: double.tryParse(payload.forexSellRate),
          forexBuyCharge: double.tryParse(payload.forexBuyCharge),
          forexSellCharge: double.tryParse(payload.forexSellCharge),
          priorityCurrency: int.tryParse(payload.priorityCurrency),
          tickerBannerDescription: rateData.tickerBannerDescription,
          offerDescription: rateData.offerDescription,
          adImageUrl: rateData.adImageUrl,
        );
        branches.add(branch);

        _logger.d('✅ Converted payload #$payloadCount to Branch: ${branch.branchName}');
      }

      _logger.i('🎯 Completed. Retrieved ${branches.length} branches for location: ${request.latitude}, ${request.longitude}');
      AppLogger.logObject('Final Branches List', branches.map((b) => b.toJson()).toList(), _logger);
      
      return branches;
    } catch (e, stackTrace) {
      AppLogger.logError('getAllBranchByLongitudeAndLatitude', e, stackTrace, _logger);
      rethrow;
    }
  }


  /// Dispose resources
  Future<void> dispose() async {
    await _channel.shutdown();
  }
}

