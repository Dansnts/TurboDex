// lib/views/pokedex/pokedex_view.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/pokedex_controller.dart';
import '../../repositories/pokedex_repository.dart';
import '../../models/vehicle.dart';
import '../../models/rarity.dart';

class PokedexView extends StatelessWidget {
  const PokedexView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<PokedexController>();
    final dex = context.watch<PokedexRepository>();

    final all = ctrl.all; // liste de tous les véhicules de ton app
    return Scaffold(
      appBar: AppBar(title: const Text('Pokédex')),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 0.82),
        itemCount: all.length,
        itemBuilder: (_, i) {
          final v = all[i];
          final st = dex.statusOf(v.id);
          return _DexCard(vehicle: v, status: st);
        },
      ),
    );
  }
}

class _DexCard extends StatelessWidget {
  final Vehicle vehicle;
  final DexStatus status;
  const _DexCard({required this.vehicle, required this.status});

  @override
  Widget build(BuildContext context) {
    final isFound = status == DexStatus.found;
    final isSeen = status == DexStatus.seenInFeed;

    Widget image;
    if (status == DexStatus.unknown) {
      image = const Center(child: Text('???', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)));
    } else {
      image = Image.network(vehicle.iconUrl, fit: BoxFit.contain);
      if (isSeen && !isFound) image = Opacity(opacity: 0.35, child: image);
    }

    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: isFound ? () => showDialog(context: context, builder: (_) => _VehicleDialog(vehicle: vehicle)) : null,
        child: Column(
          children: [
            Expanded(child: Center(child: image)),
            const SizedBox(height: 6),
            Text(isFound ? vehicle.displayName : '???', style: const TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 2),
            Text(
              isFound
                  ? vehicle.rarity.label
                  : (isSeen ? vehicle.rarity.label : '???'),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class _VehicleDialog extends StatelessWidget {
  final Vehicle vehicle;
  const _VehicleDialog({required this.vehicle});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(vehicle.displayName),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(vehicle.imageUrl, height: 140, fit: BoxFit.cover),
          const SizedBox(height: 8),
          Text('Bodywork: ${vehicle.bodywork}\nRarity: ${vehicle.rarity.label}'),
        ],
      ),
      actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Fermer'))],
    );
  }
}
