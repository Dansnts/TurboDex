import 'package:flutter/foundation.dart';

class CameraController extends ChangeNotifier {
  // MVP: on simule la capture, pas d’accès caméra/permissions
  // Tu brancheras image_picker/camera plus tard.
  String? lastCapturedImageUrl;

  Future<void> simulateCapture(String url) async {
    lastCapturedImageUrl = url;
    notifyListeners();
  }
}

