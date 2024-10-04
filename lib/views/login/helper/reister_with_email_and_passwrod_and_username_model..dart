import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:musclemate/views/login/helper/show_snack_bar_function.dart';

class RegisterUser {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> registerUserWithDetails(BuildContext context, String email,
      String password, String username) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the newly registered user
      User? user = result.user;

      if (user != null) {
        // Store the additional user information in Firestore
        try {
          await _firestore.collection('users').doc(user.uid).set({
            'uid': user.uid,
            'email': email,
            'username': username,
          });
        } catch (e) {
          throw Exception('Error storing user data: $e');
        }
      }

      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnachBarFun(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showSnachBarFun(context, 'The account already exists for that email.');
      } else {
        showSnachBarFun(context, 'An error occurred: ${e.message}');
      }
    } catch (e) {
      showSnachBarFun(context, 'An error occurred: $e');
    }
    return null;
  }
}
