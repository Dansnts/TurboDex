import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/collection_controller.dart';
import '../../models/vehicle.dart';
import '../widgets/vehicle_card.dart';

class PokedexView extends StatelessWidget {
  const PokedexView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.watch<CollectionController>();
    final all = c.allKnown;

    return Scaffold(
      appBar: AppBar(title: const Text('Pokédex')),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 0.78),
        itemCount: all.length,
        itemBuilder: (_, i) {
          final Vehicle v = all[i];
          final inCol = c.inCollection(v.id);
          return VehicleCard(
            vehicle: v,
            inCollection: inCol,
            onToggle: () => inCol ? c.remove(v.id) : c.add(v),
          );
        },
      ),
    );
  }
}

