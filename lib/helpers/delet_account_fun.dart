import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:musclemate/views/login/helper/show_snack_bar_function.dart';
import 'package:musclemate/views/onboard/splash.dart';

Future<void> deleteAccountAndFirestoreDocument(BuildContext context) async {
  try {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String? email = user.email;

      // Delete document from firestore that heve the same email of user
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot userDoc = querySnapshot.docs.first;
        await userDoc.reference.delete();
        showSnachBarFun(context, 'Your data deleted successfully');
      }

      // Delete  Authentication of user account
      await user.delete();
      showSnachBarFun(context, 'User account deleted successfully');

      Navigator.pushReplacementNamed(context, SplashScreen.id);
    }
  } catch (e) {
    showSnachBarFun(context, 'Failed to delete account: ${e.toString()}');
  }
}
