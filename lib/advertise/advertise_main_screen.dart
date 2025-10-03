import 'package:advertisment_screen/advertise/widgets/display_time_widget.dart';
import 'package:advertisment_screen/advertise/widgets/tab_hearder.dart';
import 'package:advertisment_screen/domain/branch/branch.dart';
import 'package:advertisment_screen/core/logger/app_logger.dart';

import 'package:flutter/material.dart';
import 'package:advertisment_screen/advertise/widgets/exchange_offers_card_widget.dart';
import 'package:advertisment_screen/advertise/currencybill_board_widgets/currency_billboard_container_widget.dart';
import 'package:advertisment_screen/advertise/widgets/scroll_footer_widget.dart';
import 'package:logger/logger.dart';

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
  final Logger _logger = AppLogger.createLogger('AdvertiseScreen');

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
      // Use default location (54.374500, 24.489900)
      final locationRequest = LocationRequest.defaultLocation();
      
      // Log detailed request information
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
          _branches = branches;
          _isLoading = false;
        });
        
        // Log detailed response
        AppLogger.logResponse('getAllBranchByLongitudeAndLatitude', {
          'totalBranches': branches.length,
          'branches': branches.map((b) => b.toJson()).toList(),
        }, _logger);
        
        _logger.i('✅ Successfully loaded ${branches.length} branches');
        
        // Log each branch in detail
        for (int i = 0; i < branches.length; i++) {
          final branch = branches[i];
          _logger.d('🏢 Branch [$i]: ${branch.branchName}');
          AppLogger.logObject('Branch Details [$i]', branch.toJson(), _logger);
        }
      }
    } catch (e, stackTrace) {
      AppLogger.logError('Loading branches', e, stackTrace, _logger);
      if (mounted) {
        setState(() {
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
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.3),
          //     blurRadius: 8,
          //     offset: const Offset(0, 4),
          //   ),
          // ],
        ),
        child: Stack(
          children: [
            Padding(
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
                      const ExchangeOffersCardWidget(),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: ScrollFooterWidget(),
                  ),
                ],
              ),
            ),
            // Branch loading indicator (for debugging)
            if (_isLoading)
              Positioned(
                top: 50,
                right: 20,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Loading branches...',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            // Branch count indicator (for debugging)
            // if (!_isLoading && _branches != null)
            //   Positioned(
            //     top: 50,
            //     right: 20,
            //     child: Container(
            //       padding: const EdgeInsets.all(8),
            //       decoration: BoxDecoration(
            //         color: Colors.green.withOpacity(0.8),
            //         borderRadius: BorderRadius.circular(8),
            //       ),
            //       child: Text(
            //         '${_branches!.length} branches loaded',
            //         style: const TextStyle(color: Colors.white, fontSize: 12),
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
