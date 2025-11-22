import 'model/branch.dart';
import 'model/location_request.dart';
import 'repository/branch_repository.dart';
import 'repository/branch_repository_impl.dart';

class BranchService {
  late final BranchRepository _repository;
  
  BranchService({BranchRepository? repository, String? host, int? port}) {
    _repository = repository ?? BranchRepositoryImpl(host: host, port: port);
  }

  /// Get all branches by longitude and latitude
  /// 
  /// This method retrieves branches based on geographical coordinates.
  /// Useful for finding nearby branches or branches within a specific area.
  /// 
  /// [request] - Contains latitude, longitude, and optional branch code
  /// Returns a list of [Branch] objects matching the location criteria
  Future<List<Branch>> getAllBranchByLongitudeAndLatitude(LocationRequest request) async {
    // Validate input
    if (request.latitude.isEmpty || request.longitude.isEmpty) {
      throw ArgumentError('Latitude and longitude cannot be empty');
    }

    // Validate latitude range (-90 to 90)
    final lat = double.tryParse(request.latitude);
    if (lat == null || lat < -90 || lat > 90) {
      throw ArgumentError('Invalid latitude. Must be between -90 and 90');
    }

    // Validate longitude range (-180 to 180)
    final lng = double.tryParse(request.longitude);
    if (lng == null || lng < -180 || lng > 180) {
      throw ArgumentError('Invalid longitude. Must be between -180 and 180');
    }

    final branches = await _repository.getAllBranchByLongitudeAndLatitude(request);
    
    return branches;
  }


  /// Dispose resources
  Future<void> dispose() async {
    await _repository.dispose();
  }
}
