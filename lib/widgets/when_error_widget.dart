import 'package:auto_scroll_text/auto_scroll_text.dart';
import 'package:flutter/material.dart';
import 'package:musclemate/helpers/log_out_fun.dart';
import 'package:path/path.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String text;
  const ErrorMessageWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            logoutUser(context);
          },
          icon: Icon(
            Icons.back_hand,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: AutoScrollText(text),
      ),
    );
  }
}
