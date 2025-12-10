import 'dart:async';
import 'dart:io';
import 'package:advertisment_screen/advertise/widgets/exchange_offers_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:advertisment_screen/advertise/models/branch_theme.dart';
import 'package:advertisment_screen/advertise/widgets/display_time_widget.dart';
import 'package:advertisment_screen/advertise/widgets/tab_hearder.dart';
import 'package:advertisment_screen/domain/branch/branch.dart';
import 'package:advertisment_screen/advertise/currencybill_board_widgets/currency_billboard_container_widget.dart';
import 'package:advertisment_screen/advertise/widgets/scroll_footer_widget.dart';
import 'package:advertisment_screen/advertise/widgets/offer_description_banner.dart';
import 'package:advertisment_screen/advertise/widgets/no_data_found_widget.dart';
import 'package:advertisment_screen/core/responsive/responsive_helper.dart';

class AdvertisementMainHomeScreen extends StatefulWidget {
  final bool enableRemoteTheme;

  const AdvertisementMainHomeScreen({
    super.key,
    this.enableRemoteTheme = true,
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
  bool _hasError = false;
  final FocusNode _keyboardFocusNode = FocusNode();
  bool _isLandscapeMode = false;
  Timer? _refreshTimer;
  
  @override
  void initState() {
    super.initState();
    _branchService = BranchService();
    _loadBranches();
    // Initialize orientation state - default to portrait
    _isLandscapeMode = false;
    // Start timer to refresh branch rates every 20 seconds in the background
    _refreshTimer = Timer.periodic(const Duration(seconds:100), (timer) {
      _loadBranches(backgroundRefresh: true);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _keyboardFocusNode.requestFocus();
    });
  }

  void _toggleOrientation() {
    setState(() {
      _isLandscapeMode = !_isLandscapeMode;
    });
    
    if (_isLandscapeMode) {
      // Switch to landscape
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      print('🔄 Switched to Landscape mode');
    } else {
      // Switch to portrait
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      print('🔄 Switched to Portrait mode');
    }
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    _refreshTimer?.cancel();
    _keyboardFocusNode.dispose();
    _branchService.dispose();
    super.dispose();
  }

  Future<void> _loadBranches({bool backgroundRefresh = false}) async {
    if (!mounted) return;
    
    // Only show loading indicator for initial load, not for background refreshes
    if (!backgroundRefresh) {
      setState(() {
        _isLoading = true;
        _hasError = false;
      });
    }
    
    try {
      final locationRequest = LocationRequest.defaultLocation();

      final branches = await _branchService
          .getAllBranchByLongitudeAndLatitude(locationRequest);

      if (mounted) {
        setState(() {
          _branches = branches;
          _isLoading = false;
          _hasError = false;
        });
      }
    } catch (_) {
      if (mounted) {
        // Only update error state if not a background refresh
        // Background refresh failures should be silent
        if (!backgroundRefresh) {
          setState(() {
            _branches = [];
            _isLoading = false;
            _hasError = true;
          });
        }
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
    
    // Use tracked state for desktop, MediaQuery for mobile
    final isLandscape = Platform.isWindows || Platform.isMacOS || Platform.isLinux
        ? _isLandscapeMode
        : responsive.isLandscape;

    return KeyboardListener(
      focusNode: _keyboardFocusNode,
      onKeyEvent: (KeyEvent event) {
        if (event is KeyDownEvent) {
          final isMac = Platform.isMacOS;
          final keyboard = HardwareKeyboard.instance;
          final isControlPressed = keyboard.isControlPressed;
          final isMetaPressed = keyboard.isMetaPressed;
          final isShiftPressed = keyboard.isShiftPressed;
          final isP = event.logicalKey == LogicalKeyboardKey.keyP;

          print('🔑 Key pressed: ${event.logicalKey}, Control: $isControlPressed, Meta: $isMetaPressed, Shift: $isShiftPressed, Mac: $isMac');

          // Windows/Linux: Ctrl+Shift+P
          // Mac: Cmd+Shift+P or Ctrl+Shift+P (both work)
          if (isP && isShiftPressed) {
            if (isMac && isMetaPressed) {
              // Mac: Cmd+Shift+P
              print('✅ Mac Cmd+Shift+P detected');
              _toggleOrientation();
            } else if (isControlPressed) {
              // Windows/Linux: Ctrl+Shift+P or Mac: Ctrl+Shift+P
              print('✅ Ctrl+Shift+P detected');
              _toggleOrientation();
            }
          }
        }
      },
      child: Scaffold(
      backgroundColor: theme.bodyBackground ?? Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: theme.bodyBackgroundGradient != null
              ? LinearGradient(
                  colors: theme.bodyBackgroundGradient!,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : theme.bodyBackground == null
                  ? const LinearGradient(
                      colors: [Color(0xFF2C5364), Color(0xFF203A43), Color(0xFF0F2027)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
          color: theme.bodyBackgroundGradient == null ? theme.bodyBackground : null,
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DateTimeDisplay(
                branchName: firstBranch?.branchName ?? 'Main Branch',
                headerBackgroundColor: theme.headerBackground,
                headerBackgroundGradient: theme.headerBackgroundGradient,
                branchNameTextColor: theme.branchNameTextColor,
                clockTextColor: theme.clockTextColor,
                calendarTextColor: theme.calendarTextColor,
                branchImageAsset: 'assets/images/branch_logo.png', // Branch logo asset path
              ),
              _isLoading
                  ? Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: theme.currencyTextColor ?? Colors.white,
                        ),
                      ),
                    )
                  : (_branches == null || _branches!.isEmpty)
                      ? Expanded(
                          child: NoDataFoundWidget(
                            theme: theme,
                            isError: _hasError,
                            onRefresh: () => _loadBranches(),
                          ),
                        )
                      :
                      //  isLandscape
                      //     ? 
                      //     Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Column(
                      //             children: [
                      //               TabHearder(theme: theme),
                      //               SizedBox(height: responsive.getSpacing(3)),
                      //               CurrenceyBillBoardContainerWidget(
                      //                 branches: _branches,
                      //                 theme: theme,
                      //               ),
                      //             ],
                      //           ),
                      //           // ExchangeOffersCardWidget(
                      //           //   branches: _branches,
                      //           //   theme: theme,
                      //           // ),
                      //         ],
                      //       )
                      //     : 
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    TabHearder(theme: theme),
                                    SizedBox(height: responsive.getSpacing(3)),
                                    CurrenceyBillBoardContainerWidget(
                                      branches: _branches,
                                      theme: theme,
                                      tileHeight: responsive.getHeight(isLandscape ? 0.1056 : 0.0528),
                                    ),
                                    SizedBox(height: responsive.getSpacing(2)),
                                    if(!isLandscape)
                                    OfferDescriptionBanner(
                                      branches: _branches,
                                      theme: theme,
                                    ),
                                  ],
                                ),
                             //   ExchangeOffersCardWidget(branches: _branches, theme: null,),
                              ],
                            ),
                            Spacer(),
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
    ));
  }
}
