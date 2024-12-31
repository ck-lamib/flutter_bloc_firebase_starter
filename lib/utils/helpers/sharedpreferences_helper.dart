import 'dart:async';
import 'package:flutter_bloc_firebase_starter/utils/helpers/logger_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

///for
//Prime example of singletone here.
class SharedPreferencesHelper {
  //this is initialize when this class is called for first time
  static final SharedPreferencesHelper _instance =
      SharedPreferencesHelper._internal();
  //whenever this class is called later using SharedPreferencesHelper() it always return same instance of the class created for the first time that is stored in _nstance.
  factory SharedPreferencesHelper() => _instance;
  SharedPreferencesHelper._internal();

  static SharedPreferences? _prefs;
  final CustomLogger _logger = CustomLogger(title: "SharedPreferences-Helper");

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<SharedPreferences> get _preferences async {
    if (_prefs == null) {
      _logger.w("SharedPreferences not initialized. Initializing now.");
      await init();
    }
    return _prefs!;
  }

  // String operations
  Future<bool> setString(String key, String value) async {
    try {
      final prefs = await _preferences;
      return await prefs.setString(key, value);
    } catch (e) {
      _logger.e("Error setting string: $e");
      return false;
    }
  }

  Future<String?> getString(String key) async {
    try {
      final prefs = await _preferences;
      return prefs.getString(key);
    } catch (e) {
      _logger.e("Error getting string: $e");
      return null;
    }
  }

  // Int operations
  Future<bool> setInt(String key, int value) async {
    try {
      final prefs = await _preferences;
      return await prefs.setInt(key, value);
    } catch (e) {
      _logger.e("Error setting int: $e");
      return false;
    }
  }

  Future<int?> getInt(String key) async {
    try {
      final prefs = await _preferences;
      return prefs.getInt(key);
    } catch (e) {
      _logger.e("Error getting int: $e");
      return null;
    }
  }

  // Boolean operations
  Future<bool> setBool(String key, bool value) async {
    try {
      final prefs = await _preferences;
      return await prefs.setBool(key, value);
    } catch (e) {
      _logger.e("Error setting bool: $e");
      return false;
    }
  }

  Future<bool?> getBool(String key) async {
    try {
      final prefs = await _preferences;
      return prefs.getBool(key);
    } catch (e) {
      _logger.e("Error getting bool: $e");
      return null;
    }
  }

  // Double operations
  Future<bool> setDouble(String key, double value) async {
    try {
      final prefs = await _preferences;
      return await prefs.setDouble(key, value);
    } catch (e) {
      _logger.e("Error setting double: $e");
      return false;
    }
  }

  Future<double?> getDouble(String key) async {
    try {
      final prefs = await _preferences;
      return prefs.getDouble(key);
    } catch (e) {
      _logger.e("Error getting double: $e");
      return null;
    }
  }

  // List<String> operations
  Future<bool> setStringList(String key, List<String> value) async {
    try {
      final prefs = await _preferences;
      return await prefs.setStringList(key, value);
    } catch (e) {
      _logger.e("Error setting string list: $e");
      return false;
    }
  }

  Future<List<String>?> getStringList(String key) async {
    try {
      final prefs = await _preferences;
      return prefs.getStringList(key);
    } catch (e) {
      _logger.e("Error getting string list: $e");
      return null;
    }
  }

  // Remove and clear operations
  Future<bool> remove(String key) async {
    try {
      final prefs = await _preferences;
      return await prefs.remove(key);
    } catch (e) {
      _logger.e("Error removing key: $e");
      return false;
    }
  }

  Future<bool> clear() async {
    try {
      final prefs = await _preferences;
      return await prefs.clear();
    } catch (e) {
      _logger.e("Error clearing preferences: $e");
      return false;
    }
  }

  // Check if key exists
  Future<bool> containsKey(String key) async {
    try {
      final prefs = await _preferences;
      return prefs.containsKey(key);
    } catch (e) {
      _logger.e("Error checking key existence: $e");
      return false;
    }
  }
}
