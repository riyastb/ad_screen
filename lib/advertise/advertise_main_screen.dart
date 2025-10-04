import 'package:flutter/material.dart';

import 'package:advertisment_screen/advertise/widgets/display_time_widget.dart';
import 'package:advertisment_screen/advertise/widgets/tab_hearder.dart';
import 'package:advertisment_screen/domain/branch/branch.dart';
import 'package:advertisment_screen/core/logger/app_logger.dart';
import 'package:advertisment_screen/advertise/widgets/exchange_offers_card_widget.dart';
import 'package:advertisment_screen/advertise/currencybill_board_widgets/currency_billboard_container_widget.dart';
import 'package:advertisment_screen/advertise/widgets/scroll_footer_widget.dart';

class AdvertisementMainHomeScreen extends StatefulWidget {
  const AdvertisementMainHomeScreen({super.key});
  @override
  State<AdvertisementMainHomeScreen> createState() =>
      _AdvertisementMainHomeScreenState();
}

  class _AdvertisementMainHomeScreenState
      extends State<AdvertisementMainHomeScreen> with SingleTickerProviderStateMixin {
    late final BranchService _branchService;
    List<Branch>? _branches;
    bool _isLoading = false;
    final _logger = AppLogger.createLogger('AdvertiseScreen');

    // Dummy fallback data to keep UI stable when no branches are returned
  List<Branch> _dummyBranches() {
  return const [
    Branch(
      id: 'D1',
      branchName: 'Demo Branch 1',
      branchCode: 'DEM1',
      active: true,
      countryName: 'United States',
      countryCode: 'USD',
      currencyName: 'US Dollar',
      currencyCode: 'USD',
      remittanceRate: 0.2722,
      forexBuyRate: 3.65,
      forexSellRate: 3.69,
      priorityCurrency: 1,
      tickerBannerDescription: 'Welcome to Lari Exchange • Best rates guaranteed',
    ),
    Branch(
      id: 'D2',
      branchName: 'Demo Branch 2',
      branchCode: 'DEM2',
      active: true,
      countryName: 'European Union',
      countryCode: 'EUR',
      currencyName: 'Euro',
      currencyCode: 'EUR',
      remittanceRate: 0.2500,
      forexBuyRate: 3.90,
      forexSellRate: 3.95,
      priorityCurrency: 1,
      tickerBannerDescription: 'Zero commission on remittance • Limited time offer',
    ),
    Branch(
      id: 'D3',
      branchName: 'Demo Branch 3',
      branchCode: 'DEM3',
      active: true,
      countryName: 'India',
      countryCode: 'INR',
      currencyName: 'Indian Rupee',
      currencyCode: 'INR',
      remittanceRate: 22.4500,
      forexBuyRate: 22.30,
      forexSellRate: 22.60,
      priorityCurrency: 0,
      tickerBannerDescription: 'Fast • Secure • reliable',
    ),
    Branch(
      id: 'D4',
      branchName: 'Demo Branch 4',
      branchCode: 'DEM4',
      active: true,
      countryName: 'United Kingdom',
      countryCode: 'GBP',
      currencyName: 'Pound Sterling',
      currencyCode: 'GBP',
      remittanceRate: 0.2100,
      forexBuyRate: 4.55,
      forexSellRate: 4.62,
      priorityCurrency: 1,
      tickerBannerDescription: 'Today\'s special rates available now',
    ),
    Branch(
      id: 'D5',
      branchName: 'Demo Branch 5',
      branchCode: 'DEM5',
      active: true,
      countryName: 'Australia',
      countryCode: 'AUD',
      currencyName: 'Australian Dollar',
      currencyCode: 'AUD',
      remittanceRate: 0.3700,
      forexBuyRate: 2.45,
      forexSellRate: 2.50,
      priorityCurrency: 1,
      tickerBannerDescription: 'Get your AUDs today!',
    ),
    Branch(
      id: 'D6',
      branchName: 'Demo Branch 6',
      branchCode: 'DEM6',
      active: true,
      countryName: 'Canada',
      countryCode: 'CAD',
      currencyName: 'Canadian Dollar',
      currencyCode: 'CAD',
      remittanceRate: 0.2950,
      forexBuyRate: 2.85,
      forexSellRate: 2.90,
      priorityCurrency: 1,
      tickerBannerDescription: 'Special Canadian rates available',
    ),
    Branch(
      id: 'D7',
      branchName: 'Demo Branch 7',
      branchCode: 'DEM7',
      active: true,
      countryName: 'Japan',
      countryCode: 'JPY',
      currencyName: 'Japanese Yen',
      currencyCode: 'JPY',
      remittanceRate: 36.4200,
      forexBuyRate: 0.033,
      forexSellRate: 0.034,
      priorityCurrency: 0,
      tickerBannerDescription: 'Invest in Yen • Great value',
    ),
    Branch(
      id: 'D8',
      branchName: 'Demo Branch 8',
      branchCode: 'DEM8',
      active: true,
      countryName: 'UAE',
      countryCode: 'AED',
      currencyName: 'Dirham',
      currencyCode: 'AED',
      remittanceRate: 1.0000,
      forexBuyRate: 1.01,
      forexSellRate: 1.02,
      priorityCurrency: 1,
      tickerBannerDescription: 'Best rates for UAE Dirham',
    ),
    Branch(
      id: 'D9',
      branchName: 'Demo Branch 9',
      branchCode: 'DEM9',
      active: true,
      countryName: 'Singapore',
      countryCode: 'SGD',
      currencyName: 'Singapore Dollar',
      currencyCode: 'SGD',
      remittanceRate: 0.3900,
      forexBuyRate: 2.75,
      forexSellRate: 2.78,
      priorityCurrency: 1,
      tickerBannerDescription: 'Singapore Dollar • Fast Service',
    ),
    Branch(
      id: 'D10',
      branchName: 'Demo Branch 10',
      branchCode: 'DEM10',
      active: true,
      countryName: 'Switzerland',
      countryCode: 'CHF',
      currencyName: 'Swiss Franc',
      currencyCode: 'CHF',
      remittanceRate: 0.2200,
      forexBuyRate: 4.10,
      forexSellRate: 4.15,
      priorityCurrency: 1,
      tickerBannerDescription: 'Swiss Francs available • Secure',
    ),
    Branch(
      id: 'D11',
      branchName: 'Demo Branch 11',
      branchCode: 'DEM11',
      active: true,
      countryName: 'Saudi Arabia',
      countryCode: 'SAR',
      currencyName: 'Saudi Riyal',
      currencyCode: 'SAR',
      remittanceRate: 1.0200,
      forexBuyRate: 0.98,
      forexSellRate: 1.05,
      priorityCurrency: 1,
      tickerBannerDescription: 'Best Riyal rates in town',
    ),
    Branch(
      id: 'D12',
      branchName: 'Demo Branch 12',
      branchCode: 'DEM12',
      active: true,
      countryName: 'South Africa',
      countryCode: 'ZAR',
      currencyName: 'Rand',
      currencyCode: 'ZAR',
      remittanceRate: 3.2000,
      forexBuyRate: 0.22,
      forexSellRate: 0.23,
      priorityCurrency: 0,
      tickerBannerDescription: 'Zero commission for Rand',
    ),
    Branch(
      id: 'D13',
      branchName: 'Demo Branch 13',
      branchCode: 'DEM13',
      active: true,
      countryName: 'Turkey',
      countryCode: 'TRY',
      currencyName: 'Turkish Lira',
      currencyCode: 'TRY',
      remittanceRate: 7.2000,
      forexBuyRate: 0.12,
      forexSellRate: 0.13,
      priorityCurrency: 1,
      tickerBannerDescription: 'Turkey Lira • Reliable remittance',
    ),
    Branch(
      id: 'D14',
      branchName: 'Demo Branch 14',
      branchCode: 'DEM14',
      active: true,
      countryName: 'Brazil',
      countryCode: 'BRL',
      currencyName: 'Brazilian Real',
      currencyCode: 'BRL',
      remittanceRate: 1.2500,
      forexBuyRate: 0.70,
      forexSellRate: 0.75,
      priorityCurrency: 0,
      tickerBannerDescription: 'Best for Brazil transfers',
    ),
    Branch(
      id: 'D15',
      branchName: 'Demo Branch 15',
      branchCode: 'DEM15',
      active: true,
      countryName: 'Russia',
      countryCode: 'RUB',
      currencyName: 'Ruble',
      currencyCode: 'RUB',
      remittanceRate: 18.0000,
      forexBuyRate: 0.062,
      forexSellRate: 0.064,
      priorityCurrency: 1,
      tickerBannerDescription: 'No hidden charges on Ruble',
    ),
    Branch(
      id: 'D16',
      branchName: 'Demo Branch 16',
      branchCode: 'DEM16',
      active: true,
      countryName: 'China',
      countryCode: 'CNY',
      currencyName: 'Yuan',
      currencyCode: 'CNY',
      remittanceRate: 1.9000,
      forexBuyRate: 0.55,
      forexSellRate: 0.56,
      priorityCurrency: 1,
      tickerBannerDescription: 'Remit to China with ease',
    ),
    Branch(
      id: 'D17',
      branchName: 'Demo Branch 17',
      branchCode: 'DEM17',
      active: true,
      countryName: 'New Zealand',
      countryCode: 'NZD',
      currencyName: 'NZ Dollar',
      currencyCode: 'NZD',
      remittanceRate: 0.3750,
      forexBuyRate: 2.20,
      forexSellRate: 2.24,
      priorityCurrency: 1,
      tickerBannerDescription: 'NZ Dollar • Fast & safe',
    ),
    Branch(
      id: 'D18',
      branchName: 'Demo Branch 18',
      branchCode: 'DEM18',
      active: true,
      countryName: 'Hong Kong',
      countryCode: 'HKD',
      currencyName: 'HK Dollar',
      currencyCode: 'HKD',
      remittanceRate: 2.1000,
      forexBuyRate: 0.47,
      forexSellRate: 0.48,
      priorityCurrency: 0,
      tickerBannerDescription: 'Hong Kong Dollar available',
    ),
    Branch(
      id: 'D19',
      branchName: 'Demo Branch 19',
      branchCode: 'DEM19',
      active: true,
      countryName: 'Qatar',
      countryCode: 'QAR',
      currencyName: 'Qatari Riyal',
      currencyCode: 'QAR',
      remittanceRate: 1.0100,
      forexBuyRate: 1.00,
      forexSellRate: 1.02,
      priorityCurrency: 1,
      tickerBannerDescription: 'Qatari Riyal • No extra charges',
    ),
    Branch(
      id: 'D20',
      branchName: 'Demo Branch 20',
      branchCode: 'DEM20',
      active: true,
      countryName: 'Malaysia',
      countryCode: 'MYR',
      currencyName: 'Ringgit',
      currencyCode: 'MYR',
      remittanceRate: 1.2000,
      forexBuyRate: 0.80,
      forexSellRate: 0.83,
      priorityCurrency: 1,
      tickerBannerDescription: 'Malaysia Ringgit fast transfer',
    ),
    Branch(
      id: 'D21',
      branchName: 'Demo Branch 21',
      branchCode: 'DEM21',
      active: true,
      countryName: 'Mexico',
      countryCode: 'MXN',
      currencyName: 'Peso',
      currencyCode: 'MXN',
      remittanceRate: 5.5500,
      forexBuyRate: 0.18,
      forexSellRate: 0.19,
      priorityCurrency: 0,
      tickerBannerDescription: 'Peso transfers at low rates',
    ),
    Branch(
      id: 'D22',
      branchName: 'Demo Branch 22',
      branchCode: 'DEM22',
      active: true,
      countryName: 'Sweden',
      countryCode: 'SEK',
      currencyName: 'Krona',
      currencyCode: 'SEK',
      remittanceRate: 2.9100,
      forexBuyRate: 0.37,
      forexSellRate: 0.38,
      priorityCurrency: 1,
      tickerBannerDescription: 'Remit SEK • Fast deals',
    ),
    Branch(
      id: 'D23',
      branchName: 'Demo Branch 23',
      branchCode: 'DEM23',
      active: true,
      countryName: 'Norway',
      countryCode: 'NOK',
      currencyName: 'Krone',
      currencyCode: 'NOK',
      remittanceRate: 2.6500,
      forexBuyRate: 0.39,
      forexSellRate: 0.40,
      priorityCurrency: 0,
      tickerBannerDescription: 'Best rates for NOK',
    ),
    Branch(
      id: 'D24',
      branchName: 'Demo Branch 24',
      branchCode: 'DEM24',
      active: true,
      countryName: 'Denmark',
      countryCode: 'DKK',
      currencyName: 'Krone',
      currencyCode: 'DKK',
      remittanceRate: 2.5100,
      forexBuyRate: 0.34,
      forexSellRate: 0.35,
      priorityCurrency: 1,
      tickerBannerDescription: 'Danish Krone • No fees',
    ),
    Branch(
      id: 'D25',
      branchName: 'Demo Branch 25',
      branchCode: 'DEM25',
      active: true,
      countryName: 'Thailand',
      countryCode: 'THB',
      currencyName: 'Baht',
      currencyCode: 'THB',
      remittanceRate: 8.9000,
      forexBuyRate: 0.11,
      forexSellRate: 0.12,
      priorityCurrency: 0,
      tickerBannerDescription: 'Fast Baht delivery',
    ),
    Branch(
      id: 'D26',
      branchName: 'Demo Branch 26',
      branchCode: 'DEM26',
      active: true,
      countryName: 'Philippines',
      countryCode: 'PHP',
      currencyName: 'Peso',
      currencyCode: 'PHP',
      remittanceRate: 14.2600,
      forexBuyRate: 0.065,
      forexSellRate: 0.066,
      priorityCurrency: 1,
      tickerBannerDescription: 'Philippine Peso transfers',
    ),
    Branch(
      id: 'D27',
      branchName: 'Demo Branch 27',
      branchCode: 'DEM27',
      active: true,
      countryName: 'Egypt',
      countryCode: 'EGP',
      currencyName: 'Pound',
      currencyCode: 'EGP',
      remittanceRate: 8.5800,
      forexBuyRate: 0.094,
      forexSellRate: 0.095,
      priorityCurrency: 0,
      tickerBannerDescription: 'Fast & Safe Pound exchange',
    ),
    Branch(
      id: 'D28',
      branchName: 'Demo Branch 28',
      branchCode: 'DEM28',
      active: true,
      countryName: 'Indonesia',
      countryCode: 'IDR',
      currencyName: 'Rupiah',
      currencyCode: 'IDR',
      remittanceRate: 389.6000,
      forexBuyRate: 0.0023,
      forexSellRate: 0.0025,
      priorityCurrency: 0,
      tickerBannerDescription: 'Best rates for Rupiah',
    ),
    Branch(
      id: 'D29',
      branchName: 'Demo Branch 29',
      branchCode: 'DEM29',
      active: true,
      countryName: 'Pakistan',
      countryCode: 'PKR',
      currencyName: 'Rupee',
      currencyCode: 'PKR',
      remittanceRate: 76.2000,
      forexBuyRate: 0.013,
      forexSellRate: 0.014,
      priorityCurrency: 1,
      tickerBannerDescription: 'Low commission for PKR',
    ),
    Branch(
      id: 'D30',
      branchName: 'Demo Branch 30',
      branchCode: 'DEM30',
      active: true,
      countryName: 'Bangladesh',
      countryCode: 'BDT',
      currencyName: 'Taka',
      currencyCode: 'BDT',
      remittanceRate: 22.1800,
      forexBuyRate: 0.042,
      forexSellRate: 0.044,
      priorityCurrency: 1,
      tickerBannerDescription: 'Fast Taka transfers',
    ),
  ];
}

  @override
  void initState() {
    super.initState();
    _branchService = BranchService();
    // Initialize with dummy data so first build has content
    _branches = _dummyBranches();
    _loadBranches();
  }

  @override
  void dispose() {
    _branchService.dispose();
    super.dispose();
  }
  Future<void> _loadBranches() async {
    if (!mounted) return;
    setState(() {
      _isLoading = true;
    });
      try {
        final locationRequest = LocationRequest.defaultLocation();
        AppLogger.logRequest('getAllBranchByLongitudeAndLatitude', {
          'latitude': locationRequest.latitude,
          'longitude': locationRequest.longitude,
          'branchCode': locationRequest.branchCode,
          'host': 'ratecontrol2.uat.lariexchange.com',
          'port': 443,
        }, _logger);

        AppLogger.logObject('LocationRequest', locationRequest.toJson(), _logger);

        final branches = await _branchService.getAllBranchByLongitudeAndLatitude(locationRequest);

        if (mounted) {
          setState(() {
          // Use dummy data when the fetched list is empty to avoid empty UI states
          _branches = branches.isNotEmpty ? branches : _dummyBranches();
          _isLoading = false;
          });

          AppLogger.logResponse('getAllBranchByLongitudeAndLatitude', {
          'totalBranches': (_branches ?? []).length,
          'branches': (_branches ?? []).map((b) => b.toJson()).toList(),
          }, _logger);

          if (branches.isEmpty) {
            _logger.w('⚠️ No branches returned from service. Using dummy fallback data.');
          }
          _logger.i('✅ Using ${(_branches ?? []).length} branches for display');

          for (int i = 0; i < (_branches ?? []).length; i++) {
            final branch = (_branches ?? [])[i];
            _logger.d('🏢 Branch [$i]: ${branch.branchName}');
            AppLogger.logObject('Branch Details [$i]', branch.toJson(), _logger);
          }
        }
      } catch (e, stackTrace) {
        AppLogger.logError('Loading branches', e, stackTrace, _logger);
        if (mounted) {
          setState(() {
          // On error, still show dummy data to keep UI usable
          _branches = _dummyBranches();
          _isLoading = false;
          });
        }
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF2C5364), Color(0xFF203A43), Color(0xFF0F2027)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const DateTimeDisplay(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      TabHearder(),
                      SizedBox(height: 3),
                      CurrenceyBillBoardContainerWidget(branches: _branches),
                    ],
                  ),
                  ExchangeOffersCardWidget(branches: _branches),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: ScrollFooterWidget(branches: _branches),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
