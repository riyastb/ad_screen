import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrencyBillboardTileWidget extends StatelessWidget {
  final String? currencyCode;
  final double? buyRate;
  final double? sellRate;
  final double? remittanceRate; // optional (unused in UI)
  final String baseCurrencyCode; // retained for compatibility (unused)

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
    final fontSize = screenWidth * 0.018;

    return Container(
      margin: const EdgeInsets.only(top: 16, right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar( 
                radius: fontSize,
                backgroundColor: Colors.white24,
                child: Icon(Icons.monetization_on, color: Colors.white, size: fontSize),
              ),
              const SizedBox(width: 12),
              Text(
                currencyCode ?? '-',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: fontSize + 2,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Show remittance rate first if available
              if (remittanceRate != null && remittanceRate! > 0) ...[
                _buildRemittanceRateColumn(
                  remittanceRate!,
                  Colors.green,
                  fontSize,
                  context,
                  hintText: _buildRemittanceHint(),
                ),
                const SizedBox(width: 24),
              ],
              // Show Buy and Sell forex rates
              _buildRateColumn(
                buyRate ?? 0,
                Colors.greenAccent,
                fontSize,
                context,
              ),
              const SizedBox(width: 24),
              _buildRateColumn(
                sellRate ?? 0,
                Colors.redAccent,
                fontSize,
                context,
              ),
              const SizedBox(width: 12),
            ],
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
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.08,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            value.toStringAsFixed(2),
            style: GoogleFonts.poppins(
              color: color,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
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
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.08,
      child: Column(
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
          const SizedBox(height: 4),
          Text(
            hintText,
            style: GoogleFonts.poppins(
              color: Colors.grey,
              fontSize: fontSize * 0.7,
            ),
            textAlign: TextAlign.center,
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
