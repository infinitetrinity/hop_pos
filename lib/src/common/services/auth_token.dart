import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthToken {
  static const _tokenName = "apiToken";
  static const _storage = FlutterSecureStorage();

  static Future<void> setAuthToken(String token) async {
    await _storage.write(key: _tokenName, value: token);
  }

  static Future<String?> getAuthToken() async {
    String? token = await _storage.read(key: _tokenName);
    return token;
  }

  static Future<void> deleteAuthToken() async {
    await _storage.delete(key: _tokenName);
  }
}
