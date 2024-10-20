import 'package:flutter/material.dart';
import 'package:musclemate/helpers/log_out_fun.dart';

void showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Confirm Logout"),
        content: Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              logoutUser(context);
            },
            child: Text("Logout"),
          ),
        ],
      );
    },
  );
}
