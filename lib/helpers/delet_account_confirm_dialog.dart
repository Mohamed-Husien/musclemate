import 'package:flutter/material.dart';
import 'package:musclemate/helpers/delet_account_fun.dart';
import 'package:musclemate/views/profile/profileview.dart';

Future showDeleteAccountConfirmationDialog(BuildContext context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Confirm Account Deletion"),
        content:
            Text("Are you sure you want to permanently delete your account?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await deleteAccountAndFirestoreDocument(
                  context); //call the fun that i made for delet account and user data
            },
            child: Text(
              "Delete",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ],
      );
    },
  );
}
