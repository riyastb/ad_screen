import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrencyBillboardTileWidget extends StatelessWidget {
  final String? currencyCode;
  final double? buyRate;
  final double? sellRate;
  final double? remittanceRate;
  final String baseCurrencyCode;

  const CurrencyBillboardTileWidget({
    super.key,
    required this.currencyCode,
    required this.buyRate,
    required this.sellRate,
    this.remittanceRate,
    this.baseCurrencyCode = 'AED',
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize = screenWidth * 0.016;

    return Container(
      margin: const EdgeInsets.only(top: 6, right: 6),
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 2),
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
                  backgroundColor: Colors.white24,
                  child: Icon(Icons.monetization_on, color: Colors.white, size: fontSize * 0.7),
                ),
                const SizedBox(width: 10),
                Text(
                  currencyCode ?? '-',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: fontSize + 1,
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
              Colors.redAccent,
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
        const SizedBox(height: 2),
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
