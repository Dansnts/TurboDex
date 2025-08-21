import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/collection_controller.dart';
// On alias le modèle véhicule pour éviter tout conflit et on N'IMPORTE PAS rarity.dart ici.
import '../../models/vehicle.dart' as m;
import '../widgets/vehicle_card.dart';

class CollectionView extends StatefulWidget {
  const CollectionView({super.key});

  @override
  State<CollectionView> createState() => _CollectionViewState();
}

class _CollectionViewState extends State<CollectionView> {
  String? _brand;                 // null = toutes
  String? _bodywork;              // null = toutes
  m.VehicleRarity? _rarity;       // null = toutes

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<CollectionController>();
    final List<m.Vehicle> mine = ctrl.myCollection;

    // Valeurs disponibles pour les filtres
    final brands = mine.map((v) => v.make).toSet().toList()..sort();
    final bodies = mine.map((v) => v.bodywork).toSet().toList()..sort();

    // Application des filtres
    final filtered = mine.where((v) {
      final okBrand  = _brand == null || v.make == _brand;
      final okBody   = _bodywork == null || v.bodywork == _bodywork;
      final okRarity = _rarity == null || v.rarity == _rarity;
      return okBrand && okBody && okRarity;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Ma collection')),
      body: Column(
        children: [
          // --- Filtres ---
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                DropdownButton<String?>(
                  value: _brand,
                  hint: const Text('Marque'),
                  items: <DropdownMenuItem<String?>>[
                    const DropdownMenuItem(value: null, child: Text('Toutes')),
                    ...brands.map((b) => DropdownMenuItem(value: b, child: Text(b))),
                  ],
                  onChanged: (v) => setState(() => _brand = v),
                ),
                DropdownButton<String?>(
                  value: _bodywork,
                  hint: const Text('Carrosserie'),
                  items: <DropdownMenuItem<String?>>[
                    const DropdownMenuItem(value: null, child: Text('Toutes')),
                    ...bodies.map((b) => DropdownMenuItem(value: b, child: Text(b))),
                  ],
                  onChanged: (v) => setState(() => _bodywork = v),
                ),
                DropdownButton<m.VehicleRarity?>(
                  value: _rarity,
                  hint: const Text('Rareté'),
                  items: <DropdownMenuItem<m.VehicleRarity?>>[
                    const DropdownMenuItem(value: null, child: Text('Toutes')),
                    ...m.VehicleRarity.values.map(
                          (r) => DropdownMenuItem(value: r, child: Text(_rarityLabel(r))),
                    ),
                  ],
                  onChanged: (r) => setState(() => _rarity = r),
                ),
                if (_brand != null || _bodywork != null || _rarity != null)
                  TextButton.icon(
                    onPressed: () => setState(() {
                      _brand = null;
                      _bodywork = null;
                      _rarity = null;
                    }),
                    icon: const Icon(Icons.clear),
                    label: const Text('Réinitialiser'),
                  ),
              ],
            ),
          ),

          const Divider(height: 0),

          // --- Grille ---
          Expanded(
            child: filtered.isEmpty
                ? const Center(child: Text('Aucun véhicule dans la collection'))
                : GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.82,
              ),
              itemCount: filtered.length,
              itemBuilder: (_, i) {
                final v = filtered[i]; // <- m.Vehicle
                return VehicleCard(
                  vehicle: v,
                  inCollection: true,
                  // IMPORTANT : on passe bien le Vehicle (pas l'id)
                  onToggle: () => ctrl.remove(v),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Libellés FR sans dépendre d'une extension externe
  String _rarityLabel(m.VehicleRarity r) {
    switch (r) {
      case m.VehicleRarity.common:
        return 'Commune';
      case m.VehicleRarity.rare:
        return 'Rare';
      case m.VehicleRarity.epic:
        return 'Épique';
      case m.VehicleRarity.legendary:
        return 'Légendaire';
    }
  }
}
