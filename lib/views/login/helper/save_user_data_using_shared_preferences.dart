import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUserData(String email, String username) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('email', email);
  await prefs.setString('username', username);
}
