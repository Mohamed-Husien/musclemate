import 'package:flutter/material.dart';
import 'package:musclemate/generated/l10n.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:musclemate/views/profile/edit_profile.dart';
import 'package:musclemate/views/profile/contuct.dart';
import 'package:musclemate/views/profile/privacy.dart';
import 'package:musclemate/views/login/login.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
  static const String routeName = "profile";

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String name = "ahmed";
  String email = "ahmed@gmail.com";
  String phoneNumber = "+201093757296";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            color: TColor.kPrimaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 65,
                    backgroundImage: AssetImage('assets/img/w_2.png'),
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      phoneNumber,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildProfileOption(
                    context,
                    title: S.of(context).editprofile,
                    icon: Icons.person,
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfile(
                            name: name,
                            email: email,
                            phoneNumber: phoneNumber,
                          ),
                        ),
                      );

                      if (result != null) {
                        setState(() {
                          name = result['name'];
                          email = result['email'];
                          phoneNumber = result['phone'];
                        });
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  _buildProfileOption(
                    context,
                    title: S.of(context).contactus,
                    icon: Icons.contact_support,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContactUsPage()),
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  _buildProfileOption(
                    context,
                    title: S.of(context).privacy,
                    icon: Icons.privacy_tip_outlined,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrivacyPolicyPage()),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: TColor.kPrimaryColor,
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                      textStyle: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(S.of(context).logout),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOption(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: TColor.kPrimaryColor),
      title: Text(
        title,
        style: TextStyle(fontSize: 18, color: TColor.kPrimaryColor),
      ),
      onTap: onTap,
    );
  }
}
