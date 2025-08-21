import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  static const _kPhone = 'auth_phone';
  static const _kHandle = 'auth_handle';
  static const _kDisplay = 'auth_display';
  static const _kAuthed = 'auth_authed';

  String? _phone;
  String? _handle;
  String? _display;
  bool _authed = false;

  String? get phone => _phone;
  String? get handle => _handle;
  String? get displayName => _display;
  bool get isAuthenticated => _authed;

  Future<void> load() async {
    final sp = await SharedPreferences.getInstance();
    _phone = sp.getString(_kPhone);
    _handle = sp.getString(_kHandle);
    _display = sp.getString(_kDisplay);
    _authed = sp.getBool(_kAuthed) ?? false;
  }

  Future<void> signOut() async {
    final sp = await SharedPreferences.getInstance();
    await sp.setBool(_kAuthed, false);
    _authed = false;
  }

  // DEMO: on génère un code fixe.
  Future<String> requestCode(String phone) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString(_kPhone, phone);
    _phone = phone;
    return '123456';
  }

  Future<bool> verifyCode(String code) async {
    if (code == '123456') {
      final sp = await SharedPreferences.getInstance();
      await sp.setBool(_kAuthed, true);
      _authed = true;
      return true;
    }
    return false;
  }

  Future<void> setHandle(String handle) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString(_kHandle, handle);
    _handle = handle;
  }

  Future<void> setDisplayName(String display) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString(_kDisplay, display);
    _display = display;
  }
}
