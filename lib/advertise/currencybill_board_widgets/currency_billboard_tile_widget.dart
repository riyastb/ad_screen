import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:advertisment_screen/core/responsive/responsive_helper.dart';
import 'package:advertisment_screen/advertise/models/branch_theme.dart';

class CurrencyBillboardTileWidget extends StatelessWidget {
  final String? currencyCode;
  final String? countryCode;
  final double? buyRate;
  final double? sellRate;
  final double? remittanceRate;
  final String baseCurrencyCode;
  final BranchTheme theme;

  const CurrencyBillboardTileWidget({
    super.key,
    required this.currencyCode,
    this.countryCode,
    required this.buyRate,
    required this.sellRate,
    this.remittanceRate,
    this.baseCurrencyCode = 'AED',
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    // Reduced base font size for portrait mode (1080x1920) to prevent overflow
    final baseFontSize = responsive.width * 0.012;
    final fontSize = responsive.getFontSize(baseFontSize);
    final cardBackground = theme.rateCardBackground;
    final currencyTextColor = theme.currencyTextColor ?? Colors.white;
    final transferColor = theme.transferRateTextColor ?? Colors.green;
    final buyColor = theme.buyRateTextColor ?? Colors.greenAccent;
    final sellColor = theme.sellRateTextColor ?? Colors.yellow;

    return Container(
      margin: EdgeInsets.only(
        top: responsive.getMargin(4),
        right: responsive.getMargin(4),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: responsive.getPadding(10.0),
        vertical: responsive.getPadding(4.0),
      ),
      decoration: BoxDecoration(
        gradient: cardBackground == null
            ? const LinearGradient(
                colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: cardBackground,
        borderRadius: BorderRadius.circular(responsive.getBorderRadius(14)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: responsive.getPadding(6),
            offset: Offset(0, responsive.getPadding(2)),
          ),
        ],
      ),
      child: Row(
        children: [
          // Currency
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (countryCode != null && countryCode!.isNotEmpty)
                  SizedBox(
                    width: responsive.getFontSize(40),
                    height: responsive.getFontSize(30),
                    child: Image.asset(
                      'icons/flags/png100px/${countryCode!.toLowerCase().trim()}.png',
                      package: 'country_icons',
                      width: responsive.getFontSize(40),
                      height: responsive.getFontSize(30),
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.flag_outlined,
                          size: responsive.getFontSize(30),
                          color: currencyTextColor,
                        );
                      },
                    ),
                  )
                else
                  Icon(
                    Icons.flag_outlined,
                    size: responsive.getFontSize(30),
                    color: currencyTextColor,
                  ),
                SizedBox(width: responsive.getSpacing(10)),
                Text(
                  currencyCode ?? '-',
                  style: GoogleFonts.poppins(
                    color: currencyTextColor,
                    fontSize: fontSize + responsive.getFontSize(1),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
          // Remittance (aligned even if not used)
          Expanded(
            child: remittanceRate != null && remittanceRate! > 0
                ? _buildRemittanceRateColumn(
                    remittanceRate!,
                    transferColor,
                    fontSize,
                    context,
                    hintText: _buildRemittanceHint(),
                  )
                : Center(
                    child: Text(
                      '-',
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ),
          // Forex Buy
          Expanded(
            child: _buildRateColumn(
              buyRate ?? 0,
              buyColor,
              fontSize,
              context,
            ),
          ),
          // Forex Sell
          Expanded(
            child: _buildRateColumn(
              sellRate ?? 0,
              sellColor,
              fontSize,
              context,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRateColumn(
    double value,
    Color color,
    double fontSize,
    BuildContext context,
  ) {
    return Center(
      child: Text(
        value.toStringAsFixed(2),
        style: GoogleFonts.poppins(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildRemittanceRateColumn(
    double value,
    Color color,
    double fontSize,
    BuildContext context, {
    required String hintText,
  }) {
    final responsive = context.responsive;
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value.toStringAsFixed(4),
            style: GoogleFonts.poppins(
              color: color,
              fontSize: fontSize * 0.85,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: responsive.getSpacing(0.5)),
          Text(
            hintText,
            style: GoogleFonts.poppins(
              color: Colors.grey,
              fontSize: fontSize * 0.45,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  String _buildRemittanceHint() {
    if (remittanceRate == null || remittanceRate! <= 0) return '';
    final inverse = 1 / remittanceRate!;
    final target = currencyCode ?? '';
    return '$baseCurrencyCode → $target: ${inverse.toStringAsFixed(4)}';
  }
}
