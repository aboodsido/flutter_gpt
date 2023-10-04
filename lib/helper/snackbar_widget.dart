import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String content, Color contentColor) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      closeIconColor: Colors.red,
      backgroundColor: Colors.white,
      content: Text(content, style: TextStyle(color: contentColor)),
    ),
  );
}
