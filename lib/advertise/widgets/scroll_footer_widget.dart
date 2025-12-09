import 'package:advertisment_screen/controllers/scroll_announcementcontroller.dart';
import 'package:advertisment_screen/domain/branch/model/branch.dart';
import 'package:flutter/material.dart';
import 'package:advertisment_screen/core/responsive/responsive_helper.dart';
import 'package:advertisment_screen/advertise/models/branch_theme.dart';

class ScrollFooterWidget extends StatefulWidget {
  final List<Branch>? branches;
  final BranchTheme theme;

  const ScrollFooterWidget({super.key,this.branches, required this.theme});

  @override
  State<ScrollFooterWidget> createState() => _ScrollFooterWidgetState();
}

class _ScrollFooterWidgetState extends State<ScrollFooterWidget> {
  final ScrollFooterWidgetController _controller =
      ScrollFooterWidgetController();
  String? _lastDisplayText;

  @override
  void initState() {
    super.initState();
    _controller.init(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void didUpdateWidget(ScrollFooterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Restart scrolling if content changed
    final items = widget.branches ?? const <Branch>[];
    if (items.isNotEmpty) {
      final tickerText = (items.first.tickerBannerDescription ?? '').trim();
      final displayText = tickerText.isNotEmpty
          ? tickerText
          : 'Welcome to our Exchange Services! Enjoy competitive rates and exceptional service.';
      
      if (displayText != _lastDisplayText) {
        _lastDisplayText = displayText;
        // Restart scrolling with new content
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            _controller.restart();
          }
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     final responsive = context.responsive;
     final items = widget.branches ?? const <Branch>[];
     if (items.isEmpty) {
       return SizedBox(
         height: responsive.getHeight(0.06),
       );
     }

     final tickerText = (items.first.tickerBannerDescription ?? '').trim();
     final displayText = tickerText.isNotEmpty
         ? tickerText
         : 'Welcome to our Exchange Services! Enjoy competitive rates and exceptional service.';
     
     // Initialize last display text on first build
     if (_lastDisplayText == null) {
       _lastDisplayText = displayText;
     }
    final tickerBackground = widget.theme.footerBackground;
    final tickerTextColor = widget.theme.footerTextColor ?? Colors.white;

    return Container(
      width: responsive.width,
      height: responsive.getHeight(0.053),
      decoration: BoxDecoration(
        gradient: tickerBackground == null
            ? const LinearGradient(
                colors: [Color(0xFFFFC107), Color(0xFFFFA000)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: tickerBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: responsive.getPadding(6),
            offset: Offset(0, responsive.getPadding(3)),
          ),
        ],
        borderRadius: BorderRadius.circular(responsive.getBorderRadius(8)),
      ),
     // padding: EdgeInsets.symmetric(horizontal: responsive.getPadding(12.0)),
      child: ExcludeSemantics(
        child: SingleChildScrollView(
          controller: _controller.scrollController,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(), // Disable manual scrolling, only programmatic
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Repeat the text a few times to enable continuous scrolling feel
              for (int i = 0; i < 10; i++)
                Padding(
                 padding: EdgeInsets.only(right: responsive.getPadding(48.0)),
                  child: Text(
                    displayText,
                    style: TextStyle(
                      color: tickerTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize:responsive.isLandscape? responsive.getFontSize(responsive.width * 0.018):responsive.getFontSize(responsive.width * 0.030)
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

