import 'dart:io' show File; // ignoré sur le web
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CaptureView extends StatefulWidget {
  const CaptureView({super.key});
  @override
  State<CaptureView> createState() => _CaptureViewState();
}

class _CaptureViewState extends State<CaptureView> {
  final _picker = ImagePicker();
  XFile? _shot;

  bool get _cameraSupported {
    if (kIsWeb) return true; // support web OK
    return defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
  }

  Future<void> _takePhoto() async {
    if (!_cameraSupported) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('La capture n’est pas supportée sur cette plateforme. Lance un émulateur/phone Android.')),
      );
      return;
    }

    final shot = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 85,
      maxWidth: 1600,
    );
    if (shot == null) return;

    setState(() => _shot = shot);
    _confirmSheet();
  }

  void _confirmSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        final imgWidget = kIsWeb
            ? Image.network(_shot!.path, height: 280, fit: BoxFit.cover)
            : Image.file(File(_shot!.path), height: 280, fit: BoxFit.cover);

        return Padding(
          padding: MediaQuery.of(ctx).viewInsets.add(const EdgeInsets.all(16)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              imgWidget,
              const SizedBox(height: 12),
              const Text('Publier cette photo ?', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.close),
                      label: const Text('Annuler'),
                      onPressed: () {
                        Navigator.pop(ctx);
                        setState(() => _shot = null);
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton.icon(
                      icon: const Icon(Icons.send),
                      label: const Text('Publier'),
                      onPressed: () {
                        // TODO: envoyer au backend / au feed
                        Navigator.pop(ctx);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Photo publiée (mock).')),
                        );
                        setState(() => _shot = null);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Capture')),
      body: Center(
        child: FilledButton.icon(
          icon: const Icon(Icons.camera_alt_outlined),
          label: const Text('Prendre une photo'),
          onPressed: _takePhoto,
        ),
      ),
    );
  }
}
