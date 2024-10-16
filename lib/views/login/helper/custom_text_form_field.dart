import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hientText,
      this.onChange,
      this.validator,
      required this.lable,
      this.obscure = false,
      required this.iconField,
      required this.onPressedIcon});
  final String lable;
  final String hientText;
  final Function(String)? onChange;
  final String? Function(String?)? validator;
  final bool obscure;
  final Icon iconField;
  final VoidCallback onPressedIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      validator: validator,
      onChanged: onChange,
      decoration: InputDecoration(
        suffixIcon: IconButton(onPressed: onPressedIcon, icon: iconField),
        labelText: lable,
        hintText: hientText,
        border: OutlineInputBorder(),
        errorBorder: OutlineInputBorder(),
        // enabledBorder: const OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.white),
        // ),
        // focusedBorder: const OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.blue),
        // ),
      ),
    );
  }
}
