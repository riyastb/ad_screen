import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:advertisment_screen/core/responsive/responsive_helper.dart';
import 'package:advertisment_screen/advertise/models/branch_theme.dart';

class TabHearder extends StatelessWidget {
  final BranchTheme theme;

  const TabHearder({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    // Increased by 50%: 0.012 * 1.5 = 0.018
    final baseFontSize = responsive.width * 0.018;
    final fontSize = responsive.getFontSize(baseFontSize);
    final currencyColor = theme.currencyTextColor ?? Colors.white;
    final transferColor = theme.transferRateTextColor ?? Colors.green;
    final buyColor = theme.buyRateTextColor ?? Colors.greenAccent;
    final sellColor = theme.sellRateTextColor ?? Colors.yellow;
    
    return Container(
      width: responsive.isLandscape
          ? responsive.width
          : responsive.width,
      padding: EdgeInsets.symmetric(
        horizontal: responsive.getPadding(20),
        vertical: responsive.getPadding(12),
      ),
      decoration: BoxDecoration(
        gradient: theme.rateCardBackgroundGradient != null
            ? LinearGradient(
                colors: theme.rateCardBackgroundGradient!,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : theme.rateCardBackground == null
                ? const LinearGradient(
                    colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
        color: theme.rateCardBackgroundGradient == null ? theme.rateCardBackground : null,
        borderRadius: BorderRadius.circular(responsive.getBorderRadius(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: responsive.getPadding(8),
            offset: Offset(0, responsive.getPadding(4)),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Currency',
                style: GoogleFonts.poppins(
                  color: currencyColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Transfer',
                style: GoogleFonts.poppins(
                  color: transferColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Buy',
                style: GoogleFonts.poppins(
                  color: buyColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Sell',
                style: GoogleFonts.poppins(
                  color: sellColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
