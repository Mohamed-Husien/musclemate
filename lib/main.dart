import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:musclemate/firebase_options.dart';
import 'package:musclemate/generated/l10n.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:musclemate/views/menu/menu_view.dart';
import 'package:musclemate/views/onboard/splash.dart';
import 'package:musclemate/views/chatbot/const.dart';

void main() async {
  Gemini.init(apiKey: GEMINI_API_KEY);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  @override
  void initState() {
    super.initState();
    _loadLocale();
  }

  void _loadLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String langCode = prefs.getString('lang') ?? 'en';
    setState(() {
      _locale = Locale(langCode);
    });
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          locale: _locale,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          routes: {
            MenuView.id: (context) => MenuView(),
          },
          title: 'Musclemate App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "Quicksand",
            colorScheme: ColorScheme.fromSeed(seedColor: TColor.kPrimaryColor),
            useMaterial3: false,
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}
