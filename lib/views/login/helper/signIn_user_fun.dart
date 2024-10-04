import 'package:firebase_auth/firebase_auth.dart';

Future<void> signInUserMethod(
    {required String email, required String password}) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      throw FirebaseAuthException(
        code: 'user-not-found',
        message: 'No user found for that email.',
      );
    } else if (e.code == 'wrong-password') {
      throw FirebaseAuthException(
        code: 'wrong-password',
        message: 'Wrong password provided for that user.',
      );
    } else {
      throw FirebaseAuthException(
        code:
            'The supplied auth credential is incorrect, malformed or has expired.',
        message: 'Wrong password or email provided for that user.',
      );
    }
  }
}
