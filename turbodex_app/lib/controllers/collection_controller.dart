import 'package:flutter/foundation.dart';
import '../models/vehicle.dart';
import '../repositories/vehicle_repository.dart';

class CollectionController extends ChangeNotifier {
  final VehicleRepository repo;
  CollectionController(this.repo);

  List<Vehicle> get allKnown => repo.allKnown;
  List<Vehicle> get myCollection => repo.myCollection;

  void add(Vehicle v) {
    repo.addToCollection(v);
    notifyListeners();
  }

  void remove(String id) {
    repo.removeFromCollection(id);
    notifyListeners();
  }

  bool inCollection(String id) => repo.inCollection(id);
}

