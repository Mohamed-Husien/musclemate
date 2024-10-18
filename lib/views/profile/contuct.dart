import 'package:flutter/material.dart';
import 'package:musclemate/generated/l10n.dart';
import 'package:musclemate/helpers/color_extension.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).contactus),
        centerTitle: true,
        backgroundColor: TColor.kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              S.of(context).get,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              S.of(context).we,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.email, color: TColor.kPrimaryColor),
              title: Text(
                'ahmedlshennawy10@gmail.com',
                style: TextStyle(fontSize: 17),
              ),
            ),
            Divider(thickness: 1, color: Colors.brown.shade200),
            ListTile(
              leading: Icon(Icons.phone, color: TColor.kPrimaryColor),
              title: Text(
                '+201093757296',
                style: TextStyle(fontSize: 17),
              ),
            ),
            Divider(thickness: 1, color: Colors.brown.shade200),
            ListTile(
              leading: Icon(Icons.web, color: TColor.kPrimaryColor),
              title: Text(
                'www.musclamate.com/support',
                style: TextStyle(fontSize: 17),
              ),
            ),
            Divider(thickness: 1, color: Colors.brown.shade200),
            SizedBox(height: 20),
            Text(
              S.of(context).send,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ContactForm(),
          ],
        ),
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? email;
  String? message;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: S.of(context).name,
              border: OutlineInputBorder(),
              hintText: 'Enter your name',
            ),
            onSaved: (value) => name = value,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: S.of(context).email,
              border: OutlineInputBorder(),
              hintText: 'Enter your email',
            ),
            keyboardType: TextInputType.emailAddress,
            onSaved: (value) => email = value,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            maxLines: 4,
            decoration: InputDecoration(
              labelText: S.of(context).message,
              border: OutlineInputBorder(),
              hintText: 'Enter your message',
            ),
            onSaved: (value) => message = value,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your message';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text(S.of(context).send),
            style: ElevatedButton.styleFrom(
              backgroundColor: TColor.kPrimaryColor,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              textStyle: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      print('Name: $name');
      print('Email: $email');
      print('Message: $message');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Message sent successfully!')),
      );

      _formKey.currentState?.reset();
    }
  }
}
