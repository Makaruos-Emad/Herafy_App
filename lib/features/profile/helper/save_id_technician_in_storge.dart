import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveIdTechnician(String id) async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.setString('idTechnician', id);
}

Future<String?> getIdTechnician() async {
  final prefs = await SharedPreferences.getInstance();

  return prefs.getString('idTechnician');
}