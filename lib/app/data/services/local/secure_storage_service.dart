abstract class SecureStorageService {
  Future<String?> getUsername();
  Future<void> setUsername(String username);
  Future<String?> getPassword();
  Future<void> setPassword(String password);
  Future<String?> getToken();
  Future<void> setToken(String token);
  Future<void> clearAll();
  Future<void> signOff();
}
