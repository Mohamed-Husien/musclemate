import 'package:flutter/material.dart';
import 'package:musclemate/generated/l10n.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:musclemate/views/profile/profileview.dart';
import 'package:musclemate/views/settings/language.dart';
import 'package:musclemate/views/settings/social_connect.dart';
import 'package:musclemate/views/tips/tips_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool isNotificationEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadNotificationPreference();
  }

  void _loadNotificationPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isNotificationEnabled = prefs.getBool('notification') ?? false;
    });
  }

  void _saveNotificationPreference(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('notification', value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            S.of(context).settings,
            style: TextStyle(fontSize: 26),
          ),
        ),
        backgroundColor: TColor.kPrimaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSettingsBox(
            context: context,
            title: S.of(context).editprofile,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProfileView();
              }));
            },
          ),
          _buildNotificationBox(),
          _buildSettingsBox(
            context: context,
            title: S.of(context).socailconnect,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SocialConnect();
              }));
            },
          ),
          _buildSettingsBox(
            context: context,
            title: S.of(context).Language,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Language();
              }));
            },
          ),
          _buildSettingsBox(
            context: context,
            title: S.of(context).aboutapp,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return TipsView();
              }));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsBox({
    required BuildContext context,
    required String title,
    VoidCallback? onTap,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationBox() {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).notifications,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Switch(
              value: isNotificationEnabled,
              onChanged: (value) {
                setState(() {
                  isNotificationEnabled = value;
                  _saveNotificationPreference(value);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
