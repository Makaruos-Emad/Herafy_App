import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUserType(int id) async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.setInt('UserType', id);
}

Future<int?> getUserType() async {
  final prefs = await SharedPreferences.getInstance();

  return prefs.getInt('UserType');
}