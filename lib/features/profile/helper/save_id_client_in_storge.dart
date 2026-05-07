import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveIdClient(String id) async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.setString('idClient', id);
}

Future<String?> getIdClient() async {
  final prefs = await SharedPreferences.getInstance();

  return prefs.getString('idClient');
}