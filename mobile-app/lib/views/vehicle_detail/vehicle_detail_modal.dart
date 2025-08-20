import 'package:flutter/material.dart';
import '../../models/vehicle.dart';

Future<void> showVehicleDetail(
  BuildContext context,
  Vehicle v,
  bool inCollection,
  VoidCallback onToggle,
) async {
  await showModalBottomSheet(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    showDragHandle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (_) => _VehicleDetailSheet(v: v, inCollection: inCollection, onToggle: onToggle),
  );
}

class _VehicleDetailSheet extends StatelessWidget {
  final Vehicle v;
  final bool inCollection;
  final VoidCallback onToggle;

  const _VehicleDetailSheet({required this.v, required this.inCollection, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(v.displayName, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(v.imageUrl, height: 200, fit: BoxFit.cover),
          ),
          const SizedBox(height: 12),
          Wrap(spacing: 12, runSpacing: 8, children: [
            _Chip(icon: Icons.sell_outlined, label: v.type),
            _Chip(icon: Icons.palette_outlined, label: v.color),
            _Chip(icon: Icons.calendar_today_outlined, label: '${v.year}'),
          ]),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: onToggle,
            icon: Icon(inCollection ? Icons.check : Icons.add),
            label: Text(inCollection ? 'Dans ma collection' : 'Ajouter à ma collection'),
          ),
          const SizedBox(height: 10),
          TextButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
            label: const Text('Fermer'),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _Chip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, size: 18),
        const SizedBox(width: 8),
        Text(label),
      ]),
    );
  }
}

