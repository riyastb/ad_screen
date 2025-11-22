import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:advertisment_screen/core/responsive/responsive_helper.dart';

class DateTimeDisplay extends StatefulWidget {
  final String branchName;

  const DateTimeDisplay({
    super.key,
    this.branchName = 'Main Branch',
  });

  @override
  State<DateTimeDisplay> createState() => _DateTimeDisplayState();
}

class _DateTimeDisplayState extends State<DateTimeDisplay> with SingleTickerProviderStateMixin {
  late Timer _timer;
  late DateTime _now;
  late AnimationController _colonController;
  late Animation<double> _colonAnimation;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();

    // Timer to update date & time every second
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _now = DateTime.now();
      });
    });

    // Animation for blinking colon in digital clock
    _colonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);

    _colonAnimation = Tween<double>(begin: 0, end: 1).animate(_colonController);
  }

  @override
  void dispose() {
    _timer.cancel();
    _colonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    final formattedDate = DateFormat('EEEE, MMMM d, yyyy').format(_now); // Polished date
    final hour = DateFormat('hh').format(_now);
    final minute = DateFormat('mm').format(_now);
    final second = DateFormat('ss').format(_now);
    final ampm = DateFormat('a').format(_now);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: responsive.getPadding(8.0)),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: responsive.getPadding(20),
          vertical: responsive.getPadding(12),
        ),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF0F2027),
              Color(0xFF203A43),
              Color(0xFF2C5364),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(responsive.getBorderRadius(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: Offset(0, responsive.getPadding(4)),
              blurRadius: responsive.getPadding(8),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // LEFT SIDE (Branch Info)
            Row(
              children: [
                Icon(
                  Icons.store,
                  color: Colors.white70,
                  size: responsive.getIconSize(60),
                ),
                SizedBox(width: responsive.getSpacing(12)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Branch Name',
                      style: GoogleFonts.robotoMono(
                        color: Colors.white70,
                        fontSize: responsive.getFontSize(12),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: responsive.getSpacing(4)),
                    Text(
                      widget.branchName,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: responsive.getFontSize(16),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // RIGHT SIDE (Date + Digital Clock)
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Polished Date
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: Colors.white70,
                      size: responsive.getIconSize(20),
                    ),
                    SizedBox(width: responsive.getSpacing(6)),
                    Text(
                      formattedDate,
                      style: GoogleFonts.robotoMono(
                        color: Colors.white70,
                        fontSize: responsive.getFontSize(14),
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: responsive.getSpacing(12)),

                // Digital Clock with blinking colon
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Colors.white70,
                      size: responsive.getIconSize(20),
                    ),
                    SizedBox(width: responsive.getSpacing(6)),
                    AnimatedBuilder(
                      animation: _colonAnimation,
                      builder: (context, child) {
                        return Text.rich(
                          TextSpan(
                            style: GoogleFonts.robotoMono(
                              color: Colors.white,
                              fontSize: responsive.getFontSize(32),
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(text: '$hour'),
                              TextSpan(
                                text: ':',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(_colonAnimation.value),
                                ),
                              ),
                              TextSpan(text: '$minute'),
                              TextSpan(
                                text: ':',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(_colonAnimation.value),
                                ),
                              ),
                              TextSpan(text: '$second '),
                              TextSpan(
                                text: ampm,
                                style: TextStyle(
                                  fontSize: responsive.getFontSize(16),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
