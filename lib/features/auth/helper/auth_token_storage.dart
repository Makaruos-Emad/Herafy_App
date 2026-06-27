import 'package:shared_preferences/shared_preferences.dart';

const String _authTokenKey = 'AuthToken';

Future<void> saveAuthToken(String token) async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.setString(_authTokenKey, token);
}

Future<String?> getAuthToken() async {
  final prefs = await SharedPreferences.getInstance();

  return prefs.getString(_authTokenKey);
}
