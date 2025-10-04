class Branch {
  final String id;
  final String branchName;
  final String branchCode;
  final String? latitude;
  final String? longitude;
  final String? address;
  final bool active;
  final String? lastModifiedDate;
  final String? lastModifiedTime;

  // Optional currency/rate metadata for billboard UI
  final String? countryName;
  final String? countryCode;
  final String? countryFlag;
  final String? currencyName;
  final String? currencyCode;
  final double? remittanceRate;
  final double? remittanceCharge;
  final double? forexBuyRate;
  final double? forexSellRate;
  final double? forexBuyCharge;
  final double? forexSellCharge;
  final int? priorityCurrency;
  final String? tickerBannerDescription;
  final String? offerDescription;
  final String? adImageUrl;

  const Branch({
    required this.id,
    required this.branchName,
    required this.branchCode,
    this.latitude,
    this.longitude,
    this.address,
    required this.active,
    this.lastModifiedDate,
    this.lastModifiedTime,
    this.countryName,
    this.countryCode,
    this.countryFlag,
    this.currencyName,
    this.currencyCode,
    this.remittanceRate,
    this.remittanceCharge,
    this.forexBuyRate,
    this.forexSellRate,
    this.forexBuyCharge,
    this.forexSellCharge,
    this.priorityCurrency,
    this.tickerBannerDescription,
    this.offerDescription,
    this.adImageUrl,
  });

  factory Branch.fromJson(Map<String, dynamic> json) {
    // Helper to parse numbers that may be strings or null
    double? _parseDouble(dynamic value) {
      if (value == null) return null;
      if (value is num) return value.toDouble();
      return double.tryParse(value.toString());
    }

    // Helper to parse bool from string/int/bool/json
    bool _parseBool(dynamic value) {
      if (value is bool) return value;
      if (value is int) return value != 0;
      if (value is String) return value == '1' || value.toLowerCase() == 'true';
      return false;
    }

    int? _parseInt(dynamic value) {
      if (value == null) return null;
      if (value is int) return value;
      return int.tryParse(value.toString());
    }

    return Branch(
      id: json['Id']?.toString() ?? json['id']?.toString() ?? '',
      branchName: json['BranchName'] ?? json['branchName'] ?? '',
      branchCode: json['BranchCode'] ?? json['branchCode'] ?? '',
      latitude: json['Latitude'] ?? json['latitude'],
      longitude: json['Longitude'] ?? json['longitude'],
      address: json['Address'] ?? json['address'],
      active: _parseBool(json['Active'] ?? json['active']),
      lastModifiedDate: json['LastModifiedDate'] ?? json['lastModifiedDate'],
      lastModifiedTime: json['LastModifiedTime'] ?? json['lastModifiedTime'],
      countryName: json['CountryName'] ?? json['countryName'],
      countryCode: json['CountryCode'] ?? json['countryCode'],
      countryFlag: json['CountryFlag'] ?? json['countryFlag'],
      currencyName: json['CurrencyName'] ?? json['currencyName'],
      currencyCode: json['CurrencyCode'] ?? json['currencyCode'],
      remittanceRate: _parseDouble(json['RemittanceRate'] ?? json['remittanceRate']),
      remittanceCharge: _parseDouble(json['RemittanceCharge'] ?? json['remittanceCharge']),
      forexBuyRate: _parseDouble(json['ForexBuyRate'] ?? json['forexBuyRate']),
      forexSellRate: _parseDouble(json['ForexSellRate'] ?? json['forexSellRate']),
      forexBuyCharge: _parseDouble(json['ForexBuyCharge'] ?? json['forexBuyCharge']),
      forexSellCharge: _parseDouble(json['ForexSellCharge'] ?? json['forexSellCharge']),
      priorityCurrency: _parseInt(json['PriorityCurrency'] ?? json['priorityCurrency']),
      tickerBannerDescription: json['TickerBannerDescription'] ?? json['tickerBannerDescription'],
      offerDescription: json['OfferDescription'] ?? json['offerDescription'],
      adImageUrl: json['AdImageUrl'] ?? json['adImageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'branchName': branchName,
      'branchCode': branchCode,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (address != null) 'address': address,
      'active': active ? 1 : 0,
      if (lastModifiedDate != null) 'lastModifiedDate': lastModifiedDate,
      if (lastModifiedTime != null) 'lastModifiedTime': lastModifiedTime,
      if (countryName != null) 'countryName': countryName,
      if (countryCode != null) 'countryCode': countryCode,
      if (countryFlag != null) 'countryFlag': countryFlag,
      if (currencyName != null) 'currencyName': currencyName,
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (remittanceRate != null) 'remittanceRate': remittanceRate,
      if (remittanceCharge != null) 'remittanceCharge': remittanceCharge,
      if (forexBuyRate != null) 'forexBuyRate': forexBuyRate,
      if (forexSellRate != null) 'forexSellRate': forexSellRate,
      if (forexBuyCharge != null) 'forexBuyCharge': forexBuyCharge,
      if (forexSellCharge != null) 'forexSellCharge': forexSellCharge,
      if (priorityCurrency != null) 'priorityCurrency': priorityCurrency,
      if (tickerBannerDescription != null) 'tickerBannerDescription': tickerBannerDescription,
      if (offerDescription != null) 'offerDescription': offerDescription,
      if (adImageUrl != null) 'adImageUrl': adImageUrl,
    };
  }

  @override
  String toString() => 'Branch{id: $id, branchName: $branchName, branchCode: $branchCode, active: $active}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Branch && runtimeType == other.runtimeType && id == other.id && branchCode == other.branchCode;

  @override
  int get hashCode => id.hashCode ^ branchCode.hashCode;
}
