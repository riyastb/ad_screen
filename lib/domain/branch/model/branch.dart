class Branch {
  final String id;
  final String branchName;
  final String branchCode;
  final String latitude;
  final String longitude;
  final String address;
  final bool active;
  final String lastModifiedDate;
  final String lastModifiedTime;

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

  const Branch({
    required this.id,
    required this.branchName,
    required this.branchCode,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.active,
    required this.lastModifiedDate,
    required this.lastModifiedTime,
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
  });

  factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(
      id: json['id'] ?? '',
      branchName: json['branchName'] ?? '',
      branchCode: json['branchCode'] ?? '',
      latitude: json['latitude'] ?? '',
      longitude: json['longitude'] ?? '',
      address: json['address'] ?? '',
      active: json['active'] == 1,
      lastModifiedDate: json['lastModifiedDate'] ?? '',
      lastModifiedTime: json['lastModifiedTime'] ?? '',
      countryName: json['countryName'],
      countryCode: json['countryCode'],
      countryFlag: json['countryFlag'],
      currencyName: json['currencyName'],
      currencyCode: json['currencyCode'],
      remittanceRate: (json['remittanceRate'] is num)
          ? (json['remittanceRate'] as num).toDouble()
          : double.tryParse('${json['remittanceRate']}'),
      remittanceCharge: (json['remittanceCharge'] is num)
          ? (json['remittanceCharge'] as num).toDouble()
          : double.tryParse('${json['remittanceCharge']}'),
      forexBuyRate: (json['forexBuyRate'] is num)
          ? (json['forexBuyRate'] as num).toDouble()
          : double.tryParse('${json['forexBuyRate']}'),
      forexSellRate: (json['forexSellRate'] is num)
          ? (json['forexSellRate'] as num).toDouble()
          : double.tryParse('${json['forexSellRate']}'),
      forexBuyCharge: (json['forexBuyCharge'] is num)
          ? (json['forexBuyCharge'] as num).toDouble()
          : double.tryParse('${json['forexBuyCharge']}'),
      forexSellCharge: (json['forexSellCharge'] is num)
          ? (json['forexSellCharge'] as num).toDouble()
          : double.tryParse('${json['forexSellCharge']}'),
      priorityCurrency: json['priorityCurrency'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'branchName': branchName,
      'branchCode': branchCode,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'active': active ? 1 : 0,
      'lastModifiedDate': lastModifiedDate,
      'lastModifiedTime': lastModifiedTime,
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
    };
  }

  @override
  String toString() {
    return 'Branch{id: $id, branchName: $branchName, branchCode: $branchCode, latitude: $latitude, longitude: $longitude, active: $active}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Branch &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          branchCode == other.branchCode;

  @override
  int get hashCode => id.hashCode ^ branchCode.hashCode;
}
