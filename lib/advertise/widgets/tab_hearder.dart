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

    // Use backend font size if available, otherwise fall back to responsive calculation
    final baseFontSize = responsive.width * 0.024;
    final fontSize = theme.ratesFontSize != null
        ? theme.ratesFontSize!
        : responsive.getFontSize(baseFontSize);

    final currencyColor = theme.currencyTextColor ?? Colors.white;
    final transferColor = theme.transferRateTextColor ?? Colors.green;
    final buyColor = theme.buyRateTextColor ?? Colors.greenAccent;
    final sellColor = theme.sellRateTextColor ?? Colors.yellow;

    return Container(
      width: responsive.width,
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
                    colors: [
                      Color(0xFF0F2027),
                      Color(0xFF203A43),
                      Color(0xFF2C5364),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
        color: theme.rateCardBackgroundGradient == null
            ? theme.rateCardBackground
            : null,
        borderRadius:
            BorderRadius.circular(responsive.getBorderRadius(16)),
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
          _buildHeaderItem(
            en: 'Currency',
            ar: 'العملة',
            color: currencyColor,
            fontSize: fontSize,
          ),
          _buildHeaderItem(
            en: 'Transfer',
            ar: 'التحويل',
            color: transferColor,
            fontSize: fontSize,
          ),
          _buildHeaderItem(
            en: 'Buy',
            ar: 'شراء',
            color: buyColor,
            fontSize: fontSize,
          ),
          _buildHeaderItem(
            en: 'Sell',
            ar: 'بيع',
            color: sellColor,
            fontSize: fontSize,
          ),
        ],
      ),
    );
  }

  /// Reusable bilingual header text
  Widget _buildHeaderItem({
    required String en,
    required String ar,
    required Color color,
    required double fontSize,
  }) {
    return Expanded(
  child: Center(
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

     // Arabic Text
        Text(
          ar,
          textDirection: TextDirection.rtl,
          style: GoogleFonts.cairo(
            color: color.withOpacity(0.9),
            fontSize: fontSize ,
            fontWeight: FontWeight.w600,
            height: 1.2,
          ),
        ),


      
        // Divider
        Container(
          margin: EdgeInsets.symmetric(horizontal: fontSize * 0.6),
          height: fontSize + 6,
          width: 1.5,
          decoration: BoxDecoration(
            color: Colors.grey,
            //color.withOpacity(0.35),
            borderRadius: BorderRadius.circular(2),
          ),
        ),


          // English Text
        Text(
          en,
             style: GoogleFonts.cairo(
            color: color.withOpacity(0.9),
            fontSize: fontSize ,
            fontWeight: FontWeight.w600,
            height: 1.2,
          ),
        ),


   
      ],
    ),
  ),
);


  }
}
