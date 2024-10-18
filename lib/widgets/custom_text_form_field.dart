import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.textInputType,
    this.suffixIcon,
    this.onSaved,
    this.obscureText = false,
    this.prefixIcon,
    this.decoration,
    this.fillColor,
    this.radius,
  });

  final String hintText;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final Decoration? decoration;
  final Color? fillColor;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.5),
          fontSize: 16,
        ),
        hintText: hintText,
        filled: true,
        fillColor: fillColor ?? const Color(0xFFF9FAFA),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 10),
      borderSide: const BorderSide(
        width: 1,
        color: Color(0xFFE6E9E9),
      ),
    );
  }
}
