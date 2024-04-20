import 'package:flutter/material.dart';

void showCustomSnackBar(
    BuildContext context, String message, Color backgroundColor) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(
        child: Text(
          message,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: 2),
    ),
  );
}
