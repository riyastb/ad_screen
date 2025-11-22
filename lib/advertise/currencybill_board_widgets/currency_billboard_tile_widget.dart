import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:advertisment_screen/core/responsive/responsive_helper.dart';

class CurrencyBillboardTileWidget extends StatelessWidget {
  final String? currencyCode;
  final String? flag;
  final double? buyRate;
  final double? sellRate;
  final double? remittanceRate;
  final String baseCurrencyCode;

  const CurrencyBillboardTileWidget({
    super.key,
    required this.currencyCode,
    required this.flag,
    required this.buyRate,
    required this.sellRate,
    this.remittanceRate,
    this.baseCurrencyCode = 'AED',
  });

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    final baseFontSize = responsive.width * 0.016;
    final fontSize = responsive.getFontSize(baseFontSize);

    return Container(
      margin: EdgeInsets.only(
        top: responsive.getMargin(6),
        right: responsive.getMargin(6),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: responsive.getPadding(14.0),
        vertical: responsive.getPadding(8.0),
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
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
                CircleAvatar(
                  radius: fontSize * 0.8,
                  backgroundColor: Colors.white12,
                  child: Text(
                    flag ?? "🏳️",
                    style: TextStyle(fontSize: responsive.getFontSize(30)),
                  ),
                ),
                SizedBox(width: responsive.getSpacing(10)),
                Text(
                  currencyCode ?? '-',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
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
                    Colors.green,
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
              Colors.greenAccent,
              fontSize,
              context,
            ),
          ),
          // Forex Sell
          Expanded(
            child: _buildRateColumn(
              sellRate ?? 0,
              Colors.yellow,
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          value.toStringAsFixed(4),
          style: GoogleFonts.poppins(
            color: color,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: responsive.getSpacing(2)),
        Text(
          hintText,
          style: GoogleFonts.poppins(
            color: Colors.grey,
            fontSize: fontSize * 0.65,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  String _buildRemittanceHint() {
    if (remittanceRate == null || remittanceRate! <= 0) return '';
    final inverse = 1 / remittanceRate!;
    final target = currencyCode ?? '';
    return '$baseCurrencyCode → $target: ${inverse.toStringAsFixed(4)}';
  }
}
