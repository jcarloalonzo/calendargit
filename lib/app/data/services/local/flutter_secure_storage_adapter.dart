import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const String _token = 'TOKEN';
const String _user = 'USER';
const String _password = 'PASSWORD';

class FlutterSecureStorageAdapter {
  FlutterSecureStorageAdapter({required FlutterSecureStorage secureStorage})
      : _secureStorage = secureStorage;

  final FlutterSecureStorage _secureStorage;
  Future<String?> get token async {
    final token = await _secureStorage.read(key: _token);
    return token;
  }

  Future<void> saveToken(String token) async {
    return _secureStorage.write(key: _token, value: token);
  }

  Future<String?> get username async {
    final username = await _secureStorage.read(key: _user);
    return username;
  }

  Future<void> saveUsername(String username) async {
    return _secureStorage.write(key: _user, value: username);
  }

  Future<String?> get password async {
    final password = await _secureStorage.read(key: _password);
    return password;
  }

  Future<void> savePassword(String password) async {
    return _secureStorage.write(key: _password, value: password);
  }

  Future<void> deleteAll() {
    return _secureStorage.deleteAll();
  }

  Future<void> signOff() async {
    // await _secureStorage.delete(key: _token);
    await _secureStorage.delete(key: _password);
    await _secureStorage.delete(key: _user);
  }
}
