import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/camera_controller.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<CameraController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Scanner un véhicule')),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.photo_camera, size: 80),
          const SizedBox(height: 16),
          const Text('MVP : simulation de capture'),
          const SizedBox(height: 8),
          ElevatedButton.icon(
            icon: const Icon(Icons.camera),
            label: const Text('Simuler une capture'),
            onPressed: () => ctrl.simulateCapture(
              'https://images.unsplash.com/photo-1563720223185-11003d516935?q=80&w=1400&auto=format&fit=crop',
            ),
          ),
          if (ctrl.lastCapturedImageUrl != null) ...[
            const SizedBox(height: 24),
            Text('Dernière photo :', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            Image.network(ctrl.lastCapturedImageUrl!, width: 260, height: 160, fit: BoxFit.cover),
          ],
        ]),
      ),
    );
  }
}

