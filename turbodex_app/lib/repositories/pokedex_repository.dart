import '../models/vehicle.dart';

enum DexStatus { unknown, seenInFeed, found }

class PokedexRepository {
  final List<Vehicle> _allVehicles = [];
  final Set<String> _seen = <String>{};
  final Set<String> _found = <String>{};

  List<Vehicle> get allVehicles => List.unmodifiable(_allVehicles);

  void seedVehicles(Iterable<Vehicle> vehicles) {
    _allVehicles
      ..clear()
      ..addAll(vehicles);
  }

  void markSeenFromFeed(Iterable<String> vehicleIds) {
    _seen.addAll(vehicleIds);
  }

  void markFound(String vehicleId) {
    _found.add(vehicleId);
  }

  DexStatus statusOf(String vehicleId) {
    if (_found.contains(vehicleId)) return DexStatus.found;
    if (_seen.contains(vehicleId)) return DexStatus.seenInFeed;
    return DexStatus.unknown;
  }

  int get total => _allVehicles.length;
  int get found => _found.length;
}
