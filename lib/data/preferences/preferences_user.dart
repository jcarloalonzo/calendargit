// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

// ignore: unused_element
const String _prefs_token = 'TOKEN';
const String _prefs_usuario = 'USUARIO';

class PreferencesUser {
  static final PreferencesUser _instancia = PreferencesUser._internal();

  factory PreferencesUser() {
    return _instancia;
  }

  PreferencesUser._internal();

  SharedPreferences? _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // //GET y SET
  String? get userLoginResponse {
    return _prefs?.getString(_prefs_usuario);
  }

  set userLoginResponse(String? value) {
    _prefs?.setString(_prefs_usuario, value!);
  }

  String? get token {
    return _prefs?.getString(_prefs_token);
  }

  set token(String? value) {
    _prefs?.setString(_prefs_token, value!);
  }

  // //GET y SET de la ultima página

  dispose() {
    _prefs!.remove(_prefs_usuario);
    _prefs!.remove(_prefs_token);
  }
}
