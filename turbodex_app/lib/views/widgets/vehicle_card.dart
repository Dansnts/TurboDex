import 'package:flutter/material.dart';
import '../../models/vehicle.dart';
import '../vehicle_detail/vehicle_detail_modal.dart';
import 'async_net_image.dart';

class VehicleCard extends StatelessWidget {
  final Vehicle vehicle;
  final bool inCollection;
  final VoidCallback onToggle;

  const VehicleCard({
    super.key,
    required this.vehicle,
    required this.inCollection,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    // Fallbacks d’URL : on essaie iconUrl puis imageUrl, sinon vide (AsyncNetImage mettra un placeholder).
    final String imageUrl = (vehicle.iconUrl ?? vehicle.imageUrl ?? '');

    // Certains modèles n’ont pas "type". On montre bodywork à la place.
    final String subtitleLeft = vehicle.bodywork ?? (vehicle.type ?? '—');
    final String subtitleRight = vehicle.color ?? '—';

    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => showVehicleDetail(context, vehicle, inCollection, onToggle),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Hauteur fixe pour un rendu cohérent
            AsyncNetImage(networkUrl: imageUrl, height: 156),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          vehicle.displayName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '$subtitleLeft • $subtitleRight',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: cs.onSurfaceVariant),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: onToggle,
                    icon: Icon(inCollection
                        ? Icons.check_circle
                        : Icons.add_circle_outline),
                    tooltip:
                    inCollection ? 'Dans ma collection' : 'Ajouter',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
