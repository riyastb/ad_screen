import 'package:advertisment_screen/controllers/scroll_announcementcontroller.dart';
import 'package:advertisment_screen/domain/branch/model/branch.dart';
import 'package:flutter/material.dart';
import 'package:advertisment_screen/core/responsive/responsive_helper.dart';

class ScrollFooterWidget extends StatefulWidget {
    final List<Branch>? branches;
  const ScrollFooterWidget({super.key,this.branches});

  @override
  State<ScrollFooterWidget> createState() => _ScrollFooterWidgetState();
}

class _ScrollFooterWidgetState extends State<ScrollFooterWidget> {
  final ScrollFooterWidgetController _controller =
      ScrollFooterWidgetController();

  @override
  void initState() {
    super.initState();
    _controller.init(() {
      setState(() {});
    });
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
         : 'Welcome to Lari Exchange • Best rates • Fast and secure service';
    return Container(
      width: responsive.width,
      height: responsive.getHeight(0.06),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFC107), Color(0xFFFFA000)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: responsive.getPadding(6),
            offset: Offset(0, responsive.getPadding(3)),
          ),
        ],
        borderRadius: BorderRadius.circular(responsive.getBorderRadius(8)),
      ),
      padding: EdgeInsets.symmetric(horizontal: responsive.getPadding(12.0)),
      child: ExcludeSemantics(
        child: SingleChildScrollView(
          controller: _controller.scrollController,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // Repeat the text a few times to enable continuous scrolling feel
              for (int i = 0; i < 6; i++)
                Padding(
                  padding: EdgeInsets.only(right: responsive.getPadding(48.0)),
                  child: Text(
                    displayText,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: responsive.getFontSize(responsive.width * 0.018),
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

