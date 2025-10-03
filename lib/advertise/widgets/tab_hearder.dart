import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabHearder extends StatelessWidget {
  const TabHearder({super.key});

  @override
  Widget build(BuildContext context) {
    final fontSize = MediaQuery.of(context).size.width * 0.012;

    return Container(
      width: MediaQuery.of(context).size.width * 0.68,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
          Text(
            'Currency',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
            ),
          ),
          Row(
            children: [
              Text(
                'Remittance',
                style: GoogleFonts.poppins(
                  color: Colors.yellow,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
              const SizedBox(width: 22),
              // 🔹 Small vertical separator
              Container(
                width: 2,
                height: fontSize + 4,
                color: Colors.white.withOpacity(0.5),
              ),
              const SizedBox(width: 22),
              Text(
                'Forex Buy',
                style: GoogleFonts.poppins(
                  color: Colors.greenAccent,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                'Forex Sell',
                style: GoogleFonts.poppins(
                  color: Colors.redAccent,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
