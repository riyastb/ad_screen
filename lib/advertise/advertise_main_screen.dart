import 'package:flutter/material.dart';

import 'package:advertisment_screen/advertise/models/branch_theme.dart';
import 'package:advertisment_screen/advertise/widgets/display_time_widget.dart';
import 'package:advertisment_screen/advertise/widgets/tab_hearder.dart';
import 'package:advertisment_screen/domain/branch/branch.dart';
import 'package:advertisment_screen/advertise/currencybill_board_widgets/currency_billboard_container_widget.dart';
import 'package:advertisment_screen/advertise/widgets/scroll_footer_widget.dart';
import 'package:advertisment_screen/advertise/widgets/offer_description_banner.dart';
import 'package:advertisment_screen/core/responsive/responsive_helper.dart';

class AdvertisementMainHomeScreen extends StatefulWidget {
  final bool enableRemoteTheme;

  const AdvertisementMainHomeScreen({
    super.key,
    this.enableRemoteTheme = false,
  });
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

      final branches = await _branchService
          .getAllBranchByLongitudeAndLatitude(locationRequest);

      if (mounted) {
        setState(() {
          _branches = branches;
          _isLoading = false;
        });
      }
    } catch (_) {
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
    final hasBranches = _branches?.isNotEmpty ?? false;
    final Branch? firstBranch = hasBranches ? _branches!.first : null;
    final theme = BranchTheme.fromBranch(
      firstBranch,
      useRemoteTheme: widget.enableRemoteTheme,
    );

    return Scaffold(
      backgroundColor: theme.bodyBackground ?? Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: theme.bodyBackground == null
              ? const LinearGradient(
                  colors: [Color(0xFF2C5364), Color(0xFF203A43), Color(0xFF0F2027)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: theme.bodyBackground,
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
              DateTimeDisplay(
                branchName: firstBranch?.branchName ?? 'Main Branch',
                headerBackgroundColor: theme.headerBackground,
                branchNameTextColor: theme.branchNameTextColor,
                clockTextColor: theme.clockTextColor,
                calendarTextColor: theme.calendarTextColor,
              ),
              responsive.isLandscape
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            TabHearder(theme: theme),
                            SizedBox(height: responsive.getSpacing(3)),
                            CurrenceyBillBoardContainerWidget(
                              branches: _branches,
                              theme: theme,
                            ),
                          ],
                        ),
                        // ExchangeOffersCardWidget(
                        //   branches: _branches,
                        //   theme: theme,
                        // ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            TabHearder(theme: theme),
                            SizedBox(height: responsive.getSpacing(3)),
                            CurrenceyBillBoardContainerWidget(
                              branches: _branches,
                              theme: theme,
                            ),
                            SizedBox(height: responsive.getSpacing(2)),
                            OfferDescriptionBanner(
                              branches: _branches,
                              theme: theme,
                            ),
                          ],
                        ),
                      //  ExchangeOffersCardWidget(branches: _branches),
                      ],
                    ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: responsive.getPadding(10),
                ),
                child: ScrollFooterWidget(
                  branches: _branches,
                  theme: theme,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
