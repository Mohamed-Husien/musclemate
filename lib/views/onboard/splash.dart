import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:musclemate/views/login/login.dart';
import 'package:musclemate/views/menu/menu_view.dart';
import 'package:musclemate/views/onboard/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        backgroundColor: const Color(0xffae6a46),
        duration: 4000,
        splashIconSize: 250,
        splash: CircleAvatar(
          radius: 90,
          child: Lottie.asset('assets/img/new/Animation - 1727080966366.json',
              fit: BoxFit.cover),
        ),
        nextScreen: FutureBuilder<User?>(
          future: FirebaseAuth.instance.authStateChanges().first,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // while checking about user authentication.
              return CircularProgressIndicator();
            }

            if (snapshot.hasData) {
              //to check if the the User is already authenticated, navigate to MenuView
              return MenuView();
            } else {
              // User is not authenticated, navigate to our OnBoarding
              return FirstOnBoarding();
            }
          },
        ),
      ),
    );
  }
}
