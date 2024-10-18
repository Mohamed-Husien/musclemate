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
          future: Future.value(FirebaseAuth.instance.currentUser),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasData && snapshot.data != null) {
              return MenuView();
            } else {
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
      await FirebaseAuth.instance.signOut();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FirstOnBoarding(),
        ),
      );
    }
  }
}
