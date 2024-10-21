import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:musclemate/views/login/helper/show_snack_bar_function.dart';
import 'package:musclemate/views/onboard/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

void logoutUser(BuildContext context) {
  FirebaseAuth.instance.signOut().then((value) async {
    //--------------------------------------------------------------
    //to delet UID from sharedPreference
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userUID');
    //-------------------------------------------------------
    Navigator.pushReplacementNamed(context, SplashScreen.id);
  }).catchError((error) {
    showSnachBarFun(context, "Logout failed: $error");
  });
}
