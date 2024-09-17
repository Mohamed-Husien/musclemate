import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import screenutil
import 'package:musclemate/helpers/color_extension.dart';
import 'package:musclemate/views/onboard/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // Initialize ScreenUtil here
      designSize: const Size(375, 812), // Base design size (e.g., iPhone X)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Workout Fitness',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "Quicksand",
            colorScheme: ColorScheme.fromSeed(seedColor: TColor.kPrimaryColor),
            useMaterial3: false,
          ),
          home: const splash(),
        );
      },
    );
  }
}
