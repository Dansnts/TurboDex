import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/collection_controller.dart';
import '../widgets/vehicle_card.dart';

class CollectionView extends StatelessWidget {
  const CollectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.watch<CollectionController>();
    final mine = c.myCollection;

    return Scaffold(
      appBar: AppBar(title: const Text('Ma collection')),
      body: mine.isEmpty
          ? const Center(child: Text('Ta collection est vide. Ajoute des modèles depuis le Pokédex.'))
          : GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 0.78),
        itemCount: mine.length,
        itemBuilder: (_, i) => VehicleCard(
          vehicle: mine[i],
          inCollection: true,
          onToggle: () => c.remove(mine[i].id),
        ),
      ),
    );
  }
}
