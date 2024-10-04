import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:musclemate/views/onboard/onboarding.dart';

class SplashForRegister extends StatefulWidget {
  const SplashForRegister({super.key});

  @override
  State<SplashForRegister> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SplashForRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        backgroundColor: const Color(0xffae6a46),
        duration: 3500,
        splashIconSize: 250,
        splash: CircleAvatar(
          radius: 90,
          child: Lottie.asset('assets/img/new/Animation - 1727080966366.json',
              fit: BoxFit.cover),
        ),
        nextScreen: FirstOnBoarding(),
      ),
    );
  }
}
