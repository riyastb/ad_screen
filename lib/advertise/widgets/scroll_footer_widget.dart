import 'package:advertisment_screen/controllers/scroll_announcementcontroller.dart';
import 'package:flutter/material.dart';

class ScrollFooterWidget extends StatefulWidget {
  const ScrollFooterWidget({super.key});

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
            children: List.generate(
              5,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: Text(
                  _controller.message,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.018,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
