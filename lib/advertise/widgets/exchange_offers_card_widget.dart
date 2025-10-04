import 'package:advertisment_screen/domain/branch/model/branch.dart';
import 'package:flutter/material.dart';

class ExchangeOffersCardWidget extends StatefulWidget {
  final List<Branch>? branches;
  const ExchangeOffersCardWidget({super.key, this.branches});

  @override
  State<ExchangeOffersCardWidget> createState() =>
      _ExchangeOffersCardWidgetState();
}

class _ExchangeOffersCardWidgetState extends State<ExchangeOffersCardWidget> {
  @override
  Widget build(BuildContext context) {
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

    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        gradient: !hasValidImage
            ? const LinearGradient(
                colors: [Color(0xFF203A43), Color(0xFF2C5364)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        image: hasValidImage
            ? DecorationImage(
                image: NetworkImage(adImageUrl),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.35), BlendMode.darken),
              )
            : null,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            "BEST EXCHANGE RATES",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
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
                  currencyCode,
                  "AED",
                  remittanceRate,
                );
              }).toList(),
            )
          else
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "No Priority Currency branches available",
                style: TextStyle(color: Colors.white70),
              ),
            ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFFFC107), // Amber
                  Color(0xFFFFA000), // Dark amber/orange
                ],
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
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              offerText,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.security, color: Colors.white70),
              SizedBox(width: 10),
              Text(
                "Secure Transactions • 24/7 Service",
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildRateRow(String from, String to, String rate) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("1 $from =",
            style: const TextStyle(color: Colors.white, fontSize: 16)),
        const SizedBox(width: 5),
        Text(
          rate,
          style: TextStyle(
            color: Colors.yellow[700],
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 5),
        Text(to, style: const TextStyle(color: Colors.white, fontSize: 16)),
      ],
    ),
  );
}
