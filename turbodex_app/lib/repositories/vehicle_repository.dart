import '../models/vehicle.dart';
import 'pokedex_repository.dart';

class VehicleRepository {
  final List<Vehicle> _collection = [];   // voitures trouvées par l’utilisateur
  final List<Vehicle> _showcase = [];     // max 3

  List<Vehicle> get collection => List.unmodifiable(_collection);
  List<Vehicle> get showcase => List.unmodifiable(_showcase);

  void markFound(Vehicle v, PokedexRepository dex) {
    if (_collection.any((x) => x.id == v.id)) return;
    _collection.add(v);
    dex.markFound(v.id);
  }

  bool inCollection(String id) => _collection.any((v) => v.id == id);

  /// Ajoute au showcase; si plein, remplace l’index
  void addToShowcase(Vehicle v) {
    if (_showcase.any((x) => x.id == v.id)) return;
    if (_showcase.length < 3) {
      _showcase.add(v);
    }
  }

  void replaceShowcaseAt(int index, Vehicle v) {
    if (index < 0 || index >= _showcase.length) return;
    _showcase[index] = v;
  }

  // Filtres simples
  Iterable<Vehicle> filter({
    String? brand,
    VehicleRarity? rarity,
    String? bodywork,
  }) sync* {
    for (final v in _collection) {
      if (brand != null && brand.isNotEmpty && !v.displayName.toLowerCase().contains(brand.toLowerCase())) {
        continue;
      }
      if (rarity != null && v.rarity != rarity) continue;
      if (bodywork != null && bodywork.isNotEmpty && (v.bodywork?.toLowerCase() != bodywork.toLowerCase())) {
        continue;
      }
      yield v;
    }
  }
}
