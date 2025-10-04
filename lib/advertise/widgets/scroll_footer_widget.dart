import 'package:advertisment_screen/controllers/scroll_announcementcontroller.dart';
import 'package:advertisment_screen/domain/branch/model/branch.dart';
import 'package:flutter/material.dart';

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
     final items = widget.branches ?? const <Branch>[];
     if (items.isEmpty) {
       return SizedBox(
         height: MediaQuery.of(context).size.height * 0.06,
       );
     }

     final tickerText = (items.first.tickerBannerDescription ?? '').trim();
     final displayText = tickerText.isNotEmpty
         ? tickerText
         : 'Welcome to Lari Exchange • Best rates • Fast and secure service';
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFC107), Color(0xFFFFA000)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ExcludeSemantics(
        child: SingleChildScrollView(
          controller: _controller.scrollController,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // Repeat the text a few times to enable continuous scrolling feel
              for (int i = 0; i < 6; i++)
                Padding(
                  padding: const EdgeInsets.only(right: 48.0),
                  child: Text(
                    displayText,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.018,
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

