import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:musclemate/models/user_data_model.dart';
import 'package:musclemate/views/login/helper/age_validation.dart';
import 'package:musclemate/views/login/helper/emial_and_password_validet_function.dart';
import 'package:musclemate/views/login/helper/name_validation_fun.dart';
import 'package:musclemate/views/login/helper/reister_with_email_and_passwrod_and_username_model..dart';
import 'package:musclemate/views/login/helper/save_user_data_using_shared_preferences.dart';
import 'package:musclemate/views/login/helper/show_snack_bar_function.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  GlobalKey<FormState> formKey = GlobalKey();
  bool _obscurePassword = true;
  String email = '';
  String password = '';
  String firstName = '';
  String lastName = '';
  String fullName = '';
  String age = '';

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Register')),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                          color: TColor.white,
                          borderRadius: BorderRadius.circular(27)),
                      alignment: Alignment.center,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            "assets/img/new/mo.jpg",
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    TextFormField(
                      controller: _firstNameController,
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          firstName = value;
                        });
                      },
                      validator: (value) {
                        return validateName(value);
                      },
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      controller: _lastNameController,
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          lastName = value;
                          fullName = '$firstName $lastName';
                        });
                      },
                      validator: (value) {
                        return validateName(value);
                      },
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Age',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          age = value;
                        });
                      },
                      validator: (value) {
                        return validateAge(value);
                      },
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      validator: (value) {
                        return validateEmail(value!);
                      },
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: _togglePasswordVisibility,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      validator: (value) {
                        return validatePassword(value!);
                      },
                    ),
                    const SizedBox(height: 90),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        fixedSize: Size(250.w, 50.h),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          try {
                            await createUserMethod();
                            showSnachBarFun(
                                context, 'Your register done successfully. ');
                            Navigator.pop(context);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              showSnachBarFun(context,
                                  'The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              showSnachBarFun(context,
                                  'The email already exists for that email.');
                            }
                          } catch (e) {
                            showSnachBarFun(context, e.toString());
                          }
                        }
                      },
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> createUserMethod() async {
    UserCredential user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    if (user.user != null) {
      await storeUserDataFirestore(user.user!, fullName);
    }
  }

  Future<void> storeUserDataFirestore(
    User user,
    String fullName,
  ) async {
    try {
      await _firestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'email': user.email,
        'username': fullName,
        'age': age,
      });
    } catch (e) {
      showSnachBarFun(context, 'Error storing user data');
    }
  }
}
