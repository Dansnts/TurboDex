import 'package:flutter/foundation.dart';
import '../repositories/auth_repository.dart';

class AuthController extends ChangeNotifier {
  final AuthRepository repo;
  AuthController(this.repo);

  bool _loading = false;
  String? _lastDemoCode; // pour affichage sur l'écran OTP
  String? get demoCode => _lastDemoCode;

  bool get isAuthenticated => repo.isAuthenticated;
  String? get handle => repo.handle;
  String? get displayName => repo.displayName;

  Future<void> hydrate() async {
    await repo.load();
    notifyListeners();
  }

  Future<void> signOut() async {
    await repo.signOut();
    notifyListeners();
  }

  bool get loading => _loading;

  Future<void> requestSms(String phone) async {
    _loading = true; notifyListeners();
    _lastDemoCode = await repo.requestCode(phone);
    _loading = false; notifyListeners();
  }

  Future<bool> verifyCode(String code) async {
    _loading = true; notifyListeners();
    final ok = await repo.verifyCode(code);
    _loading = false; notifyListeners();
    return ok;
  }

  Future<void> saveHandle(String h) async {
    await repo.setHandle(h);
    notifyListeners();
  }

  Future<void> saveDisplayName(String d) async {
    await repo.setDisplayName(d);
    notifyListeners();
  }
}
