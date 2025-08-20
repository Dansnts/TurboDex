import '../data/seed.dart';
import '../models/vehicle.dart';

class VehicleRepository {
  final List<Vehicle> _collection = [];

  List<Vehicle> get allKnown => List.unmodifiable(seedVehicles);
  List<Vehicle> get myCollection => List.unmodifiable(_collection);

  void addToCollection(Vehicle v) {
    if (_collection.any((x) => x.id == v.id)) return;
    _collection.add(v);
  }

  void removeFromCollection(String id) {
    _collection.removeWhere((v) => v.id == id);
  }

  bool inCollection(String id) => _collection.any((v) => v.id == id);
}

