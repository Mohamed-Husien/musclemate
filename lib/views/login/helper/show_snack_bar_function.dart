import 'package:flutter/material.dart';

void showSnachBarFun(
  BuildContext context,
  String message, {
  Color backgroundColor = const Color(0xFF6F4F28),
  Duration duration = const Duration(seconds: 2),
  SnackBarAction? action,
  TextStyle? textStyle = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ),
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: textStyle,
      ),
      backgroundColor: backgroundColor,
      duration: duration,
      action: action,
    ),
  );
}
