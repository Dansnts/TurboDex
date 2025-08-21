// lib/views/mycars/my_cars_view.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/collection_controller.dart';
import '../../models/vehicle.dart';
import '../../models/rarity.dart';
import '../widgets/vehicle_card.dart';

class MyCarsView extends StatelessWidget {
  const MyCarsView({super.key});
  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<CollectionController>();
    final cars = ctrl.myCollection;

    return Scaffold(
      appBar: AppBar(title: const Text('Ma collection')),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 0.82),
        itemCount: cars.length,
        itemBuilder: (_, i) {
          final v = cars[i];
          return VehicleCard(
            vehicle: v,
            inCollection: true,
            onToggle: () => ctrl.remove(v),
          );
        },
      ),
    );
  }
}
