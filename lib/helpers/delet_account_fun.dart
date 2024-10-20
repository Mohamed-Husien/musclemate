import 'dart:developer';

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

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot userDoc = querySnapshot.docs.first;
        await userDoc.reference.delete();
        showSnachBarFun(context, 'Your data deleted successfully');

        // Delete the user account only if the document deletion was successful
        await user.delete();
        showSnachBarFun(context, 'User account deleted successfully');

        Navigator.pushReplacementNamed(context, SplashScreen.id);
      } else {
        showSnachBarFun(context, 'User data not found in Firestore');
      }
    } else {
      showSnachBarFun(context, 'User not found');
    }
  } catch (e) {
    log('Error deleting account: $e');
    showSnachBarFun(context, 'Failed to delete account: ${e.toString()}');
  }
}
