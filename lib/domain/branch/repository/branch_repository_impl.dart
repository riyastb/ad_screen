import 'dart:async';
import 'package:grpc/grpc.dart';

import '../model/exchangerate.pbgrpc.dart';
import '../model/branch.dart';
import '../model/location_request.dart';
import 'branch_repository.dart';

class BranchRepositoryImpl implements BranchRepository {
  late ClientChannel _channel;
  late ExchangeRateServiceClient _client;
  
  BranchRepositoryImpl({String? host, int? port}) {

      final serverHost = host ?? 'ratecontrol2.socotraex.com';
    //final serverHost = host ?? 'ratecontrol2.uat.lariexchange.com';
    
    final serverPort = port ?? 443;

    _channel = ClientChannel(
      serverHost,
      port: serverPort,
      options: const ChannelOptions(
        // Use TLS for port 443
        credentials: ChannelCredentials.secure(),
      ),
    );
    _client = ExchangeRateServiceClient(_channel);
  }

  @override
  Future<List<Branch>> getAllBranchByLongitudeAndLatitude(LocationRequest request) async {
    try {
      final getReq = GetReq()
      ..latitude = '12.64766788482666'
      ..longitude = '54.00967788696289';
        // ..latitude = request.latitude
        // ..longitude = request.longitude;
        // ..latitude = '12.6496964'
        // ..longitude = '54.0205833';
      
      if (request.branchCode != null) {
        getReq.branchCode = request.branchCode!;
      }

      // Attach required metadata
      final metadata = {'Action': 'NA'};

      print('🚀 Request:');
      print('  Latitude: ${getReq.latitude}');
      print('  Longitude: ${getReq.longitude}');
      print('  BranchCode: ${getReq.branchCode}');

      // Unary call now returns RateData (with payload list + banner fields)
      final rateData = await _client.getBranchRateByLongitudeAndLatitude(
        getReq,
        options: CallOptions(metadata: metadata),
      );

      // print('✅ Response Received:');
      // print('  TickerBannerDescription: ${rateData.tickerBannerDescription}');
      // print('  OfferDescription: ${rateData.offerDescription}');
      // print('  BBColor: ${rateData.bBColor}');
      // print('  BranchNameTextColor: ${rateData.branchNameTextColor}');
      // print('  TransferRateTextColor: ${rateData.transferRateTextColor}');
      // print('  SellRateTextColor: ${rateData.sellRateTextColor}');
      // print('  FooterBgColor: ${rateData.footerBgColor}');
      // print('  RateCardBgColor: ${rateData.rateCardBgColor}');
      // print('  ClockTextColor: ${rateData.clockTextColor}');
      // print('  CalenderTextColor: ${rateData.calenderTextColor}');
      // print('  CurrencyTextColor: ${rateData.currencyTextColor}');
      // print('  BuyRateTextColor: ${rateData.buyRateTextColor}');
      // print('  FooterTextColor: ${rateData.footerTextColor}');
      // print('  HeaderBBColor: ${rateData.headerBBColor}');
      // print('  Payload Count: ${rateData.payload.length}');

      final List<Branch> branches = [];
      int payloadIndex = 0;
      for (final payload in rateData.payload) {
        payloadIndex++;
        print('📦 Payload #$payloadIndex:');
        print('  Id: ${payload.id}');
        print('  BranchName: ${payload.branchName}');
        print('  BranchCode: ${payload.branchCode}');
        print('  CurrencyCode: ${payload.currencyCode}');
        print('  ForexBuyRate: ${payload.forexBuyRate}');
        print('  ForexSellRate: ${payload.forexSellRate}');
        print('  RemittanceRate: ${payload.remittanceRate}');
        print('  PriorityCurrency: ${payload.priorityCurrency}');
               print('  flah country: ${payload.countryFlag}');
               print(' country code ${payload.countryCode}');
        
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
         // adImageUrl: rateData.adImageUrl,
          bbColor: rateData.bBColor,
          branchNameTextColor: rateData.branchNameTextColor,
          transferRateTextColor: rateData.transferRateTextColor,
          sellRateTextColor: rateData.sellRateTextColor,
          footerBgColor: rateData.footerBgColor,
          rateCardBgColor: rateData.rateCardBgColor,
          clockTextColor: rateData.clockTextColor,
          calenderTextColor: rateData.calenderTextColor,
          currencyTextColor: rateData.currencyTextColor,
          buyRateTextColor: rateData.buyRateTextColor,
          footerTextColor: rateData.footerTextColor,
          headerBBColor: rateData.headerBBColor,
        );
        branches.add(branch);
      }

      print('✅ Total Branches Created: ${branches.length}');
      return branches;
    } catch (e, stackTrace) {
      print('❌ Error: $e');
      print('Stack Trace: $stackTrace');
      rethrow;
    }
  }


  /// Dispose resources
  Future<void> dispose() async {
    await _channel.shutdown();
  }
}

