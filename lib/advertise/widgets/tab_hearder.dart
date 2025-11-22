import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:advertisment_screen/core/responsive/responsive_helper.dart';

class TabHearder extends StatelessWidget {
  const TabHearder({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    final baseFontSize = responsive.width * 0.012;
    final fontSize = responsive.getFontSize(baseFontSize);
    
    return Container(
      width: responsive.isLandscape
          ? responsive.getWidth(0.68)
          : responsive.width,
      padding: EdgeInsets.symmetric(
        horizontal: responsive.getPadding(20),
        vertical: responsive.getPadding(12),
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
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
                  color: Colors.white,
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
                  color: Colors.green,
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
                  color: Colors.greenAccent,
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
                  color: Colors.yellow,
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
