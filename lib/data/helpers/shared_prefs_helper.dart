import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {

  static const String loggedInKey = "loggedIn";
  static const String userIdKey = "userId";

  static AppPreferences shared = AppPreferences._sharedInstance();

  AppPreferences._sharedInstance();

  factory AppPreferences() => shared;


  Future<void> setIsLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(loggedInKey, true);
  }

  Future<void> setUserId(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userIdKey, userId);
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(loggedInKey) ?? false;
  }

  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userIdKey);
  }

  Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(loggedInKey);
    await prefs.remove(userIdKey);
  }
}