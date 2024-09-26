import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musclemate/models/user_data_model.dart';
import 'package:musclemate/views/login/helper/custom_text_form_field.dart';
import 'package:musclemate/views/login/helper/emial_and_password_validet_function.dart';
import 'package:musclemate/views/login/helper/show_snack_bar_function.dart';
import 'package:musclemate/views/login/helper/signIn_user_fun.dart';
import 'package:musclemate/views/login/register.dart';
import '../menu/menu_view.dart';

class Login extends StatefulWidget {
  const Login();

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? password;

  String? email;

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
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              fixedSize: Size(40.w, 20.h),
                            ),
                            onPressed: () async {},
                            child:
                                Image.asset("assets/img/new/googleicon.webp"),
                          ),
                          SizedBox(width: 25.w),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              fixedSize: Size(40.w, 20.h),
                            ),
                            onPressed: () {},
                            child: Image.asset("assets/img/new/facebook.webp"),
                          ),
                        ],
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
}
