// lib/controllers/collection_controller.dart
import 'package:flutter/foundation.dart';
import '../models/vehicle.dart';
import '../repositories/pokedex_repository.dart';
import '../repositories/user_repository.dart';

class CollectionController extends ChangeNotifier {
  final PokedexRepository dex;
  final UserRepository users;

  CollectionController(this.dex, this.users);

  /// Ta collection = véhicules trouvés
  List<Vehicle> get myCollection => dex.foundVehicles;

  void remove(Vehicle v) {
    dex.unmarkFound(v.id); // implémente un no-op si besoin
    notifyListeners();
  }

  void toggleShowcase(Vehicle v) {
    users.toggleShowcase(v.id, max: 3); // no-op si besoin
    notifyListeners();
  }
}
