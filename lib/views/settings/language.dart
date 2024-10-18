import 'package:flutter/material.dart';
import 'package:musclemate/generated/l10n.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:musclemate/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  void _changeLanguage(BuildContext context, String langCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lang', langCode);

    MyApp.of(context)?.setLocale(Locale(langCode));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            S.of(context).Language,
            style: TextStyle(fontSize: 26),
          ),
        ),
        backgroundColor: TColor.kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.white,
              child: InkWell(
                onTap: () => _changeLanguage(context, 'en'),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'English',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: TColor.kPrimaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.white,
              child: InkWell(
                onTap: () => _changeLanguage(context, 'ar'),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'العربية',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: TColor.kPrimaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
