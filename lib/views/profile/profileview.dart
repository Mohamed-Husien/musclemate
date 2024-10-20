import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:musclemate/generated/l10n.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:musclemate/helpers/confirm_dialog.dart';
import 'package:musclemate/helpers/get_current_user_email.dart';
import 'package:musclemate/helpers/loading_indicator_skeletonizer.dart';

import 'package:musclemate/views/profile/edit_profile.dart';
import 'package:musclemate/views/profile/contuct.dart';
import 'package:musclemate/views/profile/privacy.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
  static const String routeName = "profile";

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String? email;
  String? name;
  String? _userEmail;
  String? _userPhone;
  String? _image;
  late CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    email = getCurrentUserEmail()!;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: users.where('email', isEqualTo: email).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SkeletonizerIndicator();
        }
        if (snapshot.hasError) {
          return const Center(child: Text('Error loading data'));
        }
        if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
          var userDoc =
              snapshot.data!.docs.first.data() as Map<String, dynamic>;
          name = userDoc['username'] ?? 'Name not available';

          _image = userDoc['imageUrl'] ?? 'image not available';
          _userEmail = userDoc['email'] ?? 'Email not available';
          _userPhone = userDoc['phone'] ?? 'Phone not available';
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: TColor.kPrimaryColor,
            title: Text('Your account details'),
            elevation: 0,
            centerTitle: true,
          ),
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: TColor.kPrimaryColor,
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      'https://i.shgcdn.com/d61f124a-5eb2-41c7-abd1-ace0dd6f7d97/-/format/auto/-/preview/3000x3000/-/quality/lighter/',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 16,
                    left: 16,
                    top: 70,
                  ),
                  child: SingleChildScrollView(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 84,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: _image!,
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                name!,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: TColor.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                _userEmail!,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: TColor.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  ),
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
                                name: name!,
                                phoneNumber: _userPhone!,
                                profileImage: _image!,
                              ),
                            ),
                          );

                          if (result != null) {
                            setState(() {
                              name = result['name'];
                              email = result['email'];
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
                      SizedBox(height: 64),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: TColor.kPrimaryColor,
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 5,
                          textStyle: TextStyle(fontSize: 18),
                        ),
                        onPressed: () {
                          showLogoutConfirmationDialog(context);
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
      },
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
