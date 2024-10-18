import 'package:flutter/material.dart';
import 'package:musclemate/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:musclemate/helpers/color_extension.dart';

class SocialConnect extends StatelessWidget {
  const SocialConnect({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            S.of(context).socailconnect,
            style: TextStyle(fontSize: 26),
          ),
        ),
        backgroundColor: TColor.kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                _launchUrl('https://www.facebook.com');
              },
              child: SocialBox(
                iconPath: 'assets/img/new/facebook.webp',
                title: S.of(context).facebook,
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                _launchUrl('https://www.twitter.com');
              },
              child: SocialBox(
                iconPath: 'assets/img/twitter.png',
                title: S.of(context).twitter,
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                _launchUrl('https://www.linkedin.com');
              },
              child: SocialBox(
                iconPath: 'assets/img/Linkdin.png',
                title: S.of(context).LinkedIn,
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                _launchUrl('https://www.tumblr.com');
              },
              child: SocialBox(
                iconPath: 'assets/img/tumblr.png',
                title: S.of(context).tumblr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialBox extends StatelessWidget {
  final String iconPath;
  final String title;

  const SocialBox({required this.iconPath, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Image.asset(
            iconPath,
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
