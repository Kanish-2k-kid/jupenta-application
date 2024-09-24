import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  // Method to save email and password to SharedPreferences
  Future<void> createCache(String email, String password) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    await _preferences.setString("email", email);
    await _preferences.setString("password", password);
  }

  // Method to read the email from SharedPreferences
  Future<String?> readCache() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    return _preferences.getString("email");
  }

  // Method to remove the email and password from SharedPreferences
  Future<void> removeCache(String email, String password) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    await _preferences.remove("email");
    await _preferences.remove("password");
  }
}
