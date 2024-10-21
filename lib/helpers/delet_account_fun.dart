import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:musclemate/views/login/helper/show_snack_bar_function.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> deleteAccountAndFirestoreDocument(BuildContext context) async {
  try {
    // Get the currently logged-in user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Used the  UID to find the document in Firestore
      String uid = user.uid;

      // Get the document that match UID
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      // Check if the document exists
      if (userDoc.exists) {
        // Delete the Firestore document
        await userDoc.reference.delete();
        showSnachBarFun(context, 'Your data deleted successfully');

        // Delete the user account after delete document
        await user.delete();
        showSnachBarFun(context, 'User account deleted successfully');
//---------------------------------------
        // Remove UID from SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.remove('userUID');
//----------------------------------------------
        // Navigate to the SplashScreen after deletion
      } else {
        showSnachBarFun(context, 'User data not found ');
      }
    } else {
      showSnachBarFun(context, 'User not found');
    }
  } catch (e) {
    showSnachBarFun(context, 'Failed to delete account: ${e.toString()}');
  }
}
