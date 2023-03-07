import 'package:shared_preferences/shared_preferences.dart';

enum UserType {user, artisan, unknown}
class AppPreferences {

  static const String loggedInKey = "loggedIn";
  static const String userIdKey = "userId";
  static const String userTypeKey = "userType";

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

  Future<void> setUserType(UserType user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userTypeKey, user.name);
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(loggedInKey) ?? false;
  }

  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userIdKey);
  }

  Future<UserType?> getUserType() async {
    final prefs = await SharedPreferences.getInstance();
    final type = prefs.getString(userTypeKey);
    if(type == UserType.user.name) {
      return UserType.user;
    } else if(type == UserType.artisan.name) {
      return UserType.artisan;
    } else {
      return UserType.unknown;
    }

  }

  Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(loggedInKey);
    await prefs.remove(userIdKey);
    await prefs.remove(userTypeKey);
  }
}