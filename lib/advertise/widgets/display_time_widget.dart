import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:advertisment_screen/core/responsive/responsive_helper.dart';

class DateTimeDisplay extends StatefulWidget {
  final String branchName;
  final Color? headerBackgroundColor;
  final List<Color>? headerBackgroundGradient;
  final Color? branchNameTextColor;
  final Color? clockTextColor;
  final Color? calendarTextColor;
  final String? branchImageAsset;
  final double? branchNameFontSize;
  final double? dateFontSize;
  final double? timeFontSize;

  const DateTimeDisplay({
    super.key,
    this.branchName = 'Main Branch',
    this.headerBackgroundColor,
    this.headerBackgroundGradient,
    this.branchNameTextColor,
    this.clockTextColor,
    this.calendarTextColor,
    this.branchImageAsset,
    this.branchNameFontSize,
    this.dateFontSize,
    this.timeFontSize,
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
    final branchTextColor = widget.branchNameTextColor ?? Colors.white;
    final branchLabelColor = branchTextColor.withOpacity(0.7);
    final clockTextColor = widget.clockTextColor ?? Colors.white;
    final calendarTextColor = widget.calendarTextColor ?? Colors.white70;
    
    // Use backend font sizes if available, otherwise fall back to responsive calculation
    final branchNameFontSize = widget.branchNameFontSize != null
        ? widget.branchNameFontSize!
        : responsive.getFontSize(21);
    final dateFontSize = widget.dateFontSize != null
        ? widget.dateFontSize!
        : responsive.getFontSize(14);
    final timeFontSize = widget.timeFontSize != null
        ? widget.timeFontSize!
        : responsive.getFontSize(32);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: responsive.getPadding(8.0)),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: responsive.getPadding(20),
          vertical: responsive.getPadding(12),
        ),
        decoration: BoxDecoration(
          gradient: widget.headerBackgroundGradient != null
              ? LinearGradient(
                  colors: widget.headerBackgroundGradient!,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : widget.headerBackgroundColor == null
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
          color: widget.headerBackgroundGradient == null ? widget.headerBackgroundColor : null,
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
                widget.branchImageAsset != null && widget.branchImageAsset!.isNotEmpty
                    ? Container(
                        width: responsive.getIconSize(68),
                        height: responsive.getIconSize(68),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(responsive.getBorderRadius(8)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(responsive.getBorderRadius(8)),
                          child: Image.asset(
                            'assets/images/socotra_small.png',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.store,
                                color: branchLabelColor,
                                size: responsive.getIconSize(60),
                              );
                            },
                          ),
                        ),
                      )
                    : Icon(
                        Icons.store,
                        color: branchLabelColor,
                        size: responsive.getIconSize(60),
                      ),
                SizedBox(width: responsive.getSpacing(12)),
               Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'Socotra Exchange Center',
     style: GoogleFonts.cairo(
        color: branchTextColor,
        fontSize: branchNameFontSize,
        fontWeight: FontWeight.w700,
      ),
    ),
    SizedBox(height: responsive.getSpacing(6)),
    Text(
     'مركز سقطرى للصرافة',
      //textDirection: TextDirection.RTL,
      style: GoogleFonts.cairo(
        color: branchTextColor,
        fontSize: branchNameFontSize,
        fontWeight: FontWeight.w700,
      ),
    ),
  ],
)

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
                      color: calendarTextColor,
                      size: responsive.getIconSize(20),
                    ),
                    SizedBox(width: responsive.getSpacing(6)),
                    Text(
                      formattedDate,
                      style: GoogleFonts.cairo(
                        color: calendarTextColor,
                        fontSize: dateFontSize,
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
                      color: clockTextColor,
                      size: responsive.getIconSize(20),
                    ),
                    SizedBox(width: responsive.getSpacing(6)),
                    AnimatedBuilder(
                      animation: _colonAnimation,
                      builder: (context, child) {
                        return Text.rich(
                          TextSpan(
                            style: GoogleFonts.cairo(
                              color: clockTextColor,
                              fontSize: timeFontSize,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(text: '$hour'),
                              TextSpan(
                                text: ':',
                                style: TextStyle(
                                  color: clockTextColor.withOpacity(_colonAnimation.value),
                                ),
                              ),
                              TextSpan(text: '$minute'),
                              TextSpan(
                                text: ':',
                                style: TextStyle(
                                  color: clockTextColor.withOpacity(_colonAnimation.value),
                                ),
                              ),
                              TextSpan(text: '$second '),
                              TextSpan(
                                text: ampm,
                                style: TextStyle(
                                  fontSize: timeFontSize * 0.5,
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
