import 'flutter_secure_storage_adapter.dart';
import 'secure_storage_service.dart';

class SecureStorageServiceImpl implements SecureStorageService {
  SecureStorageServiceImpl({required this.flutterSecureStorageAdapter});

  final FlutterSecureStorageAdapter flutterSecureStorageAdapter;

  @override
  Future<void> clearAll() => flutterSecureStorageAdapter.deleteAll();

  @override
  Future<String?> getPassword() {
    return flutterSecureStorageAdapter.password;
  }

  @override
  Future<String?> getUsername() {
    return flutterSecureStorageAdapter.username;
  }

  @override
  Future<void> signOff() => flutterSecureStorageAdapter.signOff();

  @override
  Future<String?> getToken() {
    return flutterSecureStorageAdapter.token;
  }

  @override
  Future<void> setPassword(String password) async {
    await flutterSecureStorageAdapter.savePassword(password);
  }

  @override
  Future<void> setToken(String token) async {
    await flutterSecureStorageAdapter.saveToken(token);
  }

  @override
  Future<void> setUsername(String username) async {
    await flutterSecureStorageAdapter.saveUsername(username);
  }
}
