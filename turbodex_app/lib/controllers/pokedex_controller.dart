import 'package:flutter/material.dart';
import '../repositories/pokedex_repository.dart';
import '../repositories/user_repository.dart';

class PokedexController extends ChangeNotifier {
  final PokedexRepository dex;
  final UserRepository users;
  PokedexController(this.dex, this.users);

  /// Optionnel : utilisé si tu veux déclencher un warm-up manuellement
  void warmup(Iterable<String> vehicleIds) {
    dex.warmupFromFeed(vehicleIds);
    notifyListeners();
  }

  void markFound(String vehicleId, {int xp = 5}) {
    dex.markFound(vehicleId);
    users.markFoundVehicle(vehicleId);
    users.addXp(xp);
    notifyListeners();
  }

  int get found => dex.foundCount;
  int get total => dex.total;
}
