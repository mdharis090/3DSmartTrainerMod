import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  StorageService._internal();

  late SharedPreferences _prefs;
  final FlutterSecureStorage _secure = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // ── SharedPreferences ────────────────────────────────
  Future<void> setString(String key, String value) => _prefs.setString(key, value);
  String?       getString(String key)               => _prefs.getString(key);

  Future<void> setBool(String key, bool value)      => _prefs.setBool(key, value);
  bool?         getBool(String key)                  => _prefs.getBool(key);

  Future<void> setInt(String key, int value)        => _prefs.setInt(key, value);
  int?          getInt(String key)                   => _prefs.getInt(key);

  Future<void> remove(String key)                   => _prefs.remove(key);
  Future<void> clearAll()                           => _prefs.clear();

  bool containsKey(String key) => _prefs.containsKey(key);

  // ── Secure Storage ───────────────────────────────────
  Future<void>    setSecure(String key, String value) => _secure.write(key: key, value: value);
  Future<String?> getSecure(String key)               => _secure.read(key: key);
  Future<void>    removeSecure(String key)            => _secure.delete(key: key);
  Future<void>    clearSecure()                       => _secure.deleteAll();
}
