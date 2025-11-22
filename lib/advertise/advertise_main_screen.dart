import 'package:flutter/material.dart';

import 'package:advertisment_screen/advertise/widgets/display_time_widget.dart';
import 'package:advertisment_screen/advertise/widgets/tab_hearder.dart';
import 'package:advertisment_screen/domain/branch/branch.dart';
import 'package:advertisment_screen/core/logger/app_logger.dart';
import 'package:advertisment_screen/advertise/widgets/exchange_offers_card_widget.dart';
import 'package:advertisment_screen/advertise/currencybill_board_widgets/currency_billboard_container_widget.dart';
import 'package:advertisment_screen/advertise/widgets/scroll_footer_widget.dart';
import 'package:advertisment_screen/core/responsive/responsive_helper.dart';

class AdvertisementMainHomeScreen extends StatefulWidget {
  const AdvertisementMainHomeScreen({super.key});
  @override
  State<AdvertisementMainHomeScreen> createState() =>
      _AdvertisementMainHomeScreenState();
}

class _AdvertisementMainHomeScreenState
    extends State<AdvertisementMainHomeScreen>
    with SingleTickerProviderStateMixin {
  late final BranchService _branchService;
  List<Branch>? _branches;
  bool _isLoading = false;
  final _logger = AppLogger.createLogger('AdvertiseScreen');
  
  @override
  void initState() {
    super.initState();
    _branchService = BranchService();
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
      AppLogger.logRequest(
          'getAllBranchByLongitudeAndLatitude',
          {
            'latitude': locationRequest.latitude,
            'longitude': locationRequest.longitude,
            'branchCode': locationRequest.branchCode,
            'host': 'ratecontrol.uat.lariexchange.com',
            'port': 443,
          },
          _logger);

      AppLogger.logObject('LocationRequest', locationRequest.toJson(), _logger);

      final branches = await _branchService
          .getAllBranchByLongitudeAndLatitude(locationRequest);

      if (mounted) {
        setState(() {
          _branches = branches;
          _isLoading = false;
        });

        AppLogger.logResponse(
            'getAllBranchByLongitudeAndLatitude',
            {
              'totalBranches': (_branches ?? []).length,
              'branches': (_branches ?? []).map((b) => b.toJson()).toList(),
            },
            _logger);

        if (branches.isEmpty) {
          _logger.w('⚠️ No branches returned from service.');
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
          _branches = [];
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
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
              blurRadius: responsive.getPadding(8),
              offset: Offset(0, responsive.getPadding(4)),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(
            right: responsive.getPadding(10),
            left: responsive.getPadding(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             const DateTimeDisplay(),
              responsive.isLandscape
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            TabHearder(),
                            SizedBox(height: responsive.getSpacing(3)),
                            CurrenceyBillBoardContainerWidget(
                                branches: _branches),
                          ],
                        ),
                        ExchangeOffersCardWidget(branches: _branches),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            TabHearder(),
                            SizedBox(height: responsive.getSpacing(3)),
                            CurrenceyBillBoardContainerWidget(
                                branches: _branches),
                          ],
                        ),
                      //  ExchangeOffersCardWidget(branches: _branches),
                      ],
                    ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: responsive.getPadding(10),
                ),
                child: ScrollFooterWidget(branches: _branches),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
