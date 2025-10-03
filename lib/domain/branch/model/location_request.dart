class LocationRequest {
  final String latitude;
  final String longitude;
  final String? branchCode;

  const LocationRequest({
    required this.latitude,
    required this.longitude,
    this.branchCode,
  });

  /// Creates a LocationRequest with default coordinates (54.374500, 24.489900)
  factory LocationRequest.defaultLocation({String? branchCode}) {
    return LocationRequest(
      latitude: '54.374500',
      longitude: '24.489900',
      branchCode: branchCode,
    );
  }

  factory LocationRequest.fromJson(Map<String, dynamic> json) {
    return LocationRequest(
      latitude: json['latitude'] ?? '',
      longitude: json['longitude'] ?? '',
      branchCode: json['branchCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      if (branchCode != null) 'branchCode': branchCode,
    };
  }

  @override
  String toString() {
    return 'LocationRequest{latitude: $latitude, longitude: $longitude, branchCode: $branchCode}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationRequest &&
          runtimeType == other.runtimeType &&
          latitude == other.latitude &&
          longitude == other.longitude &&
          branchCode == other.branchCode;

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode ^ branchCode.hashCode;
}
