import 'package:advertisment_screen/domain/branch/model/branch.dart';
import 'package:flutter/material.dart';
import 'package:advertisment_screen/core/responsive/responsive_helper.dart';
import 'package:advertisment_screen/advertise/models/branch_theme.dart';

class ExchangeOffersCardWidget extends StatefulWidget {
  final List<Branch>? branches;
  final BranchTheme theme;

  const ExchangeOffersCardWidget({super.key, this.branches, required this.theme});

  @override
  State<ExchangeOffersCardWidget> createState() =>
      _ExchangeOffersCardWidgetState();
}

class _ExchangeOffersCardWidgetState extends State<ExchangeOffersCardWidget> {
  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    // Filter branches with priorityCurrency == 1
    final filteredBranches = (widget.branches ?? [])
        .where((branch) => branch.priorityCurrency == 1)
        .take(5)
        .toList(); // Take max 5 entries

    // Use first branch as source for banner/offer data
    final first = (widget.branches?.isNotEmpty ?? false) ? widget.branches!.first : null;
    final offerText = (first?.offerDescription ?? '').trim().isNotEmpty
        ? first!.offerDescription!.trim()
        : 'Zero Commission!\nLimited Time Offer';
    final adImageUrl = (first?.adImageUrl ?? '').trim();
    bool _isValidHttpUrl(String url) {
      if (url.isEmpty) return false;
      final uri = Uri.tryParse(url);
      if (uri == null) return false;
      final hasScheme = uri.scheme == 'http' || uri.scheme == 'https';
      return hasScheme && (uri.host.isNotEmpty);
    }
    final hasValidImage = _isValidHttpUrl(adImageUrl);

    final backgroundColor =
        widget.theme.headerBackground ?? widget.theme.rateCardBackground;
    final offerBackground = widget.theme.footerBackground;
    final offerTextColor = widget.theme.footerTextColor ?? Colors.white;

    return Container(
      width: responsive.getWidth(0.3),
      height: responsive.getHeight(0.8),
      decoration: BoxDecoration(
        gradient: (!hasValidImage && backgroundColor == null)
            ? const LinearGradient(
                colors: [Color(0xFF203A43), Color(0xFF2C5364)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: !hasValidImage ? backgroundColor : null,
        image: hasValidImage
            ? DecorationImage(
                image: NetworkImage(adImageUrl),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.35), BlendMode.darken),
              )
            : null,
        borderRadius: BorderRadius.circular(responsive.getBorderRadius(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(0, responsive.getPadding(2)),
            blurRadius: responsive.getPadding(4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "BEST EXCHANGE RATES",
            style: TextStyle(
              color: Colors.white,
              fontSize: responsive.getFontSize(22),
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          if (filteredBranches.isNotEmpty)
            Column(
              children: filteredBranches.map((branch) {
                final remittanceRate =
                    branch.remittanceRate?.toStringAsFixed(4) ?? '-';
                final currencyCode = branch.currencyCode ?? '-';
                return _buildRateRow(
                  context,
                  currencyCode,
                  "AED",
                  remittanceRate,
                  widget.theme,
                );
              }).toList(),
            )
          else
            Padding(
              padding: EdgeInsets.all(responsive.getPadding(16.0)),
              child: Text(
                "No Priority Currency branches available",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: responsive.getFontSize(14),
                ),
              ),
            ),
          Container(
            padding: EdgeInsets.all(responsive.getPadding(20)),
            margin: EdgeInsets.symmetric(horizontal: responsive.getMargin(15)),
            decoration: BoxDecoration(
              gradient: offerBackground == null
                  ? const LinearGradient(
                      colors: [
                        Color(0xFFFFC107), // Amber
                        Color(0xFFFFA000), // Dark amber/orange
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              color: offerBackground,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: responsive.getPadding(6),
                  offset: Offset(0, responsive.getPadding(3)),
                ),
              ],
              borderRadius: BorderRadius.circular(responsive.getBorderRadius(15)),
            ),
            child: Text(
              offerText,
              style: TextStyle(
                fontSize: responsive.getFontSize(18),
                fontWeight: FontWeight.bold,
                color: offerTextColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.security,
                color: Colors.white70,
                size: responsive.getIconSize(20),
              ),
              SizedBox(width: responsive.getSpacing(10)),
              Text(
                "Secure Transactions • 24/7 Service",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: responsive.getFontSize(14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildRateRow(
  BuildContext context,
  String from,
  String to,
  String rate,
  BranchTheme theme,
) {
  final responsive = context.responsive;
  final primaryTextColor = theme.currencyTextColor ?? Colors.white;
  final highlightColor = theme.buyRateTextColor ?? Colors.yellow[700] ?? Colors.yellow;
  return Padding(
    padding: EdgeInsets.symmetric(vertical: responsive.getPadding(8)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "1 $from =",
          style: TextStyle(
            color: primaryTextColor,
            fontSize: responsive.getFontSize(16),
          ),
        ),
        SizedBox(width: responsive.getSpacing(5)),
        Text(
          rate,
          style: TextStyle(
            color: highlightColor,
            fontSize: responsive.getFontSize(18),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: responsive.getSpacing(5)),
        Text(
          to,
          style: TextStyle(
            color: primaryTextColor,
            fontSize: responsive.getFontSize(16),
          ),
        ),
      ],
    ),
  );
}
