import 'dart:io';
import 'dart:typed_data';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:path/path.dart' as p;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:musclemate/views/login/helper/age_validation.dart';
import 'package:musclemate/views/login/helper/emial_and_password_validet_function.dart';
import 'package:musclemate/views/login/helper/name_validation_fun.dart';

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
  String? url;
  @override
  void dispose() {
    super.dispose();
    _firstNameController;
    _lastNameController;
    _emailController;
    _passwordController;
    // upLoadImage();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  Uint8List? image;
  var _selectedImage;
  var pickedImage;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Register')),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Form(
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
                      ListTile(
                        title: Text('Click here to add your profile picture'),
                        titleTextStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            pickImageFromGallery();
                          },
                          icon: Icon(
                            Icons.add_a_photo,
                          ),
                        ),
                        leading: Container(
                          width: 65.h,
                          height: 65.h,
                          decoration: BoxDecoration(
                            color: TColor.white,
                            borderRadius: BorderRadius.circular(27),
                          ),
                          alignment: Alignment.center,
                          child: image != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image(
                                    image: MemoryImage(image!),
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Icon(
                                    Icons.person_2_rounded,
                                    weight: 60.h,
                                  ),
                                ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _firstNameController,
                        decoration: const InputDecoration(
                          labelText: 'First Name',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {
                            firstName = value.trim();
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
                            lastName = value.trim();
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
                            isLoading = true;
                            setState(() {});
                            try {
                              await upLoadImage();
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
                          isLoading = false;
                          setState(() {});
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

  Future<void> storeUserDataFirestore(User user, String fullName) async {
    try {
      await _firestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'email': user.email,
        'username': fullName,
        'age': age,
        'imageUrl': url,
      });
    } catch (e) {
      showSnachBarFun(context, 'Error storing user data');
    }
  }

  Future pickImageFromGallery() async {
    pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;
    setState(
      () {
        _selectedImage = File(pickedImage.path);
        image = _selectedImage!.readAsBytesSync();
      },
    );
  }

  Future<void> upLoadImage() async {
    if (pickedImage == null) {
      if (mounted) showSnachBarFun(context, 'Please select an image first');
      return;
    }
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference reference = storage.ref().child(p.basename(pickedImage.path));

    try {
      File imageFile = File(pickedImage.path);
      if (!imageFile.existsSync()) {
        if (mounted)
          showSnachBarFun(context, 'Selected image file does not exist');
        return;
      }

      UploadTask uploadTask = reference.putFile(imageFile);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

      if (taskSnapshot.state == TaskState.success) {
        String downloadUrl = await reference.getDownloadURL();
        print(downloadUrl);
        if (mounted) {
          setState(() {
            url = downloadUrl;
          });
        }
      } else {
        if (mounted)
          showSnachBarFun(context, 'Image upload failed. Please try again.');
      }
    } catch (e) {
      if (mounted)
        showSnachBarFun(context, 'Error uploading image: ${e.toString()}');
    }
  }
}
