import 'dart:io';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:musclemate/helpers/get_current_user_email.dart';
import 'package:path/path.dart' as p;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:musclemate/generated/l10n.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:musclemate/views/login/helper/show_snack_bar_function.dart';
import 'package:musclemate/views/profile/helper/profile_custom_text_form_field.dart';

class EditProfile extends StatefulWidget {
  final String name;
  final String phoneNumber;
  final String profileImage;
  const EditProfile({
    Key? key,
    required this.name,
    required this.phoneNumber,
    required this.profileImage,
  }) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;

  late TextEditingController phoneController;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? email;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);

    phoneController = TextEditingController(text: widget.phoneNumber);
    email = getCurrentUserEmail()!;
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Uint8List? image;
  var _selectedImage;
  var pickedImage;
  String? url;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).editprofile),
        centerTitle: true,
        backgroundColor: TColor.kPrimaryColor,
      ),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.brown.shade300, Colors.brown.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  CustomTextFormField(
                    controller: nameController,
                    hintText: 'Enter your name',
                    prefixIcon: Icon(Icons.person),
                  ),
                  SizedBox(height: 16.0),
                  CustomTextFormField(
                    controller: phoneController,
                    hintText: 'Enter your phone number',
                    textInputType: TextInputType.phone,
                    prefixIcon: Icon(Icons.phone),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.brown.shade400,
                        width: 2,
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        'Click here to add your profile picture',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
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
                          width: 50.h,
                          height: 50.h,
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
                                    width: 40,
                                    height: 40,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: CachedNetworkImage(
                                    imageUrl: widget.profileImage,
                                    width: 40,
                                    height: 40,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: TColor.kPrimaryColor,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                      textStyle: TextStyle(fontSize: 18),
                    ),
                    onPressed: () async {
                      try {
                        await _submitForm();
                        Navigator.pop(context);
                      } catch (e) {
                        showSnachBarFun(context, e.toString());
                      }
                    },
                    child: Text(S.of(context).save),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      isLoading = true;
      setState(() {});
      await upLoadImage();
      await updateUserDocument();
    }
    isLoading = false;
    setState(() {});
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
      if (mounted)
        // showSnachBarFun(context, 'Please select an image first');
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

  Future<void> updateUserDocument() async {
    if (email != null) {
      // Query Firestore to find the document with the matching email
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Get the document reference
        DocumentSnapshot userDoc = querySnapshot.docs.first;

        // Update my document with new data
        await userDoc.reference.update({
          'username': nameController.text ?? widget.name,
          'imageUrl': url ?? widget.profileImage,
          'phone': phoneController.text ?? widget.phoneNumber,
        });
        showSnachBarFun(context, 'Profile updated successfully');
      } else {
        showSnachBarFun(context, 'No data found with the matching Profile');
      }
    } else {
      showSnachBarFun(context, "you didn't update any data!");
    }
  }
}
