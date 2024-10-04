import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:musclemate/views/login/helper/custom_text_form_field.dart';
import 'package:musclemate/views/login/helper/emial_and_password_validet_function.dart';
import 'package:musclemate/views/login/helper/show_snack_bar_function.dart';
import 'package:musclemate/views/login/helper/signIn_user_fun.dart';
import 'package:musclemate/views/login/register.dart';
import 'package:sign_in_button/sign_in_button.dart';
import '../menu/menu_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? password;
  String? email;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 50.h),
                      Text(
                        "LOGIN",
                        style: TextStyle(
                            color: const Color(0xff442712),
                            fontWeight: FontWeight.bold,
                            fontSize: 45.sp),
                      ),
                      SizedBox(height: 40.h),
                      Text(
                        "Hey!, Enter your details to sign in to your account",
                        style: TextStyle(
                            color: const Color(0xff442712), fontSize: 13.sp),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 80.h),
                      SizedBox(
                        width: 350.w,
                        // height: 60.h,
                        child: CustomTextFormField(
                          onChange: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                          validator: (value) => validateEmail(value!),
                          hientText: 'Enter your email',
                          lable: 'Email',
                          iconField: Icon(Icons.email),
                          onPressedIcon: () {},
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                        width: 350.w,
                        // height: 60.h,//to make the field hight doesn't be smaller when throw any validate message bellow the filed
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: const Color(0xff442712),
                              ),
                              onPressed: _togglePasswordVisibility,
                            ),
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            border: const OutlineInputBorder(),
                            errorBorder: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          validator: (Value) => validatePassword(Value!),
                        ),
                      ),
                      SizedBox(height: 40.h),
                      ElevatedButton(
                        //button for sign in and navigation if done successfully
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          fixedSize: Size(250.w, 50.h),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            try {
                              await signInUserMethod(
                                  email: email!, password: password!);

                              showSnachBarFun(context, 'Login successful.');
                              Navigator.pushNamed(context, MenuView.id,
                                  arguments: email);
                            } on FirebaseAuthException catch (e) {
                              showSnachBarFun(context,
                                  e.message ?? 'Authentication failed.');
                            } catch (e) {
                              showSnachBarFun(context,
                                  'Unexpected error occurred: ${e.toString()}');
                            }
                          }
                        },
                        child: const Text("Login"),
                      ),
                      SizedBox(height: 40.h),
                      const Text(
                        "... or sign in with ...",
                        style: TextStyle(color: Color(0xff442712)),
                      ),
                      SizedBox(height: 30.h),
                      SizedBox(width: 25.w),
                      SignInButton(
                        Buttons.google,
                        onPressed: () async {
                          try {
                            await signInWithGoogle();
                            showSnachBarFun(context, 'Login successful.');
                            Navigator.pushNamed(context, MenuView.id,
                                arguments: email);
                          } on Exception catch (e) {
                            showSnachBarFun(context, e.toString());
                          }
                        },
                        text: 'sign in with google ',
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account? "),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RegistrationPage(),
                                ),
                              );
                            },
                            child: Text(
                              "Register now",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<UserCredential?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      return null; // Handle the case where googleUser is null
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;

    if (googleAuth == null) {
      // Handle the case where googleAuth is null
      return null;
    }

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await storeUserDataFirestore(
        googleUser.displayName!, googleUser.photoUrl!, googleUser.email);

    setState(() {
      email = googleUser.email;
    });

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> storeUserDataFirestore(
      String fullName, String url, String email) async {
    try {
      await _firestore.collection('users').doc().set({
        'email': email,
        'username': fullName,
        'imageUrl': url,
      });
    } catch (e) {
      showSnachBarFun(context, 'Error storing user data');
    }
  }
}
