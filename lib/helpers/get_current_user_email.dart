import 'package:firebase_auth/firebase_auth.dart';

String? getCurrentUserEmail() {
  User? user = FirebaseAuth.instance.currentUser;

  return user?.email;
}
