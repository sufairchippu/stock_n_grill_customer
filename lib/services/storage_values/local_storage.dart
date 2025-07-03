import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences _prefs;
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static int getInt(String key, {int defaultValue = 0}) {
    return _prefs.getInt(key) ?? defaultValue;
  }

  static bool getBool(String key, {bool defaultValue = false}) {
    return _prefs.getBool(key) ?? defaultValue;
  }

  static String getString(String key, {String value = ''}) {
    return _prefs.getString(key) ?? value;
  }

  static Future<bool> setInt(String key, int value) async {
    return await _prefs.setInt(key, value);
  }

  static Future<bool> setBool(String key, bool value) async {
    return _prefs.setBool(key, value);
  }

  static Future<bool> setString(String key, String value) async {
    return _prefs.setString(key, value);
  }

  static bool getUserLoggedIn() {
    return _prefs.getBool('isLogged') ?? false;
  }

  static Future<bool> clearall() async {
    return _prefs.clear();

    ///do changes>> specficlly clear each
  }
}
