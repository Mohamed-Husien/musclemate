import 'package:flutter/material.dart';
import 'package:musclemate/generated/l10n.dart';

class EditProfile extends StatefulWidget {
  final String name;
  final String email;
  final String phoneNumber;

  const EditProfile({
    Key? key,
    required this.name,
    required this.email,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    emailController = TextEditingController(text: widget.email);
    phoneController = TextEditingController(text: widget.phoneNumber);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).editprofile),
        centerTitle: true,
        backgroundColor: Colors.brown.shade600,
      ),
      body: Container(
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
                  controller: emailController,
                  hintText: 'Enter your email',
                  textInputType: TextInputType.emailAddress,
                  prefixIcon: Icon(Icons.email),
                ),
                SizedBox(height: 16.0),
                CustomTextFormField(
                  controller: phoneController,
                  hintText: 'Enter your phone number',
                  textInputType: TextInputType.phone,
                  prefixIcon: Icon(Icons.phone),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.brown.shade600,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  onPressed: _submitForm,
                  child: Text(S.of(context).save),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // Retrieve updated values
      String updatedName = nameController.text;
      String updatedEmail = emailController.text;
      String updatedPhoneNumber = phoneController.text;

      // Pass back the updated data to the previous page
      Navigator.pop(context, {
        'name': updatedName,
        'email': updatedEmail,
        'phone': updatedPhoneNumber,
      });
    }
  }
}

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final Icon prefixIcon;
  final TextInputType? textInputType;
  final TextEditingController controller;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    this.textInputType,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 15),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.brown.shade400, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.brown.shade600, width: 2),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
