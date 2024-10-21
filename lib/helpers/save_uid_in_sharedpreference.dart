import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> storeUserUID() async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    String uid = user.uid;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userUID', uid);
  }
}

Future<String?> getUserUID() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(
      'userUID'); // This returns the stored UID, or null if not found.
}
