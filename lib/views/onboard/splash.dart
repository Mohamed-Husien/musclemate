import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:musclemate/views/menu/menu_view.dart';
import 'package:musclemate/views/onboard/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUserAndLogoutIfNeeded(
        context); // Check if user exists in Firebase and logout if needed
  }

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
              // While checking user authentication status.
              return const CircularProgressIndicator();
            }

            if (snapshot.hasData) {
              // User is authenticated, navigate to MenuView
              return MenuView();
            } else {
              // User is not authenticated, navigate to OnBoarding screen
              return FirstOnBoarding();
            }
          },
        ),
      ),
    );
  }

  Future<void> checkUserAndLogoutIfNeeded(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // If no user is signed in, perform sign out
      await FirebaseAuth.instance.signOut();

      // Navigate to the onboarding screen or another appropriate screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FirstOnBoarding(),
        ),
      ); // Replace '/onboarding' with your route for the onboarding screen
    }
  }
}
