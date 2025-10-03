import '../model/branch.dart';
import '../model/location_request.dart';

abstract class BranchRepository {
  /// Get all branches by longitude and latitude
  Future<List<Branch>> getAllBranchByLongitudeAndLatitude(LocationRequest request);
  
  /// Dispose resources
  Future<void> dispose();
}
