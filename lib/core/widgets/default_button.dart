// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

Widget defaultButton(
        {required String title,
        required Color backgroundColor,
        required Color textColor,
        required Color borderColor,
        required double width,
        required double height,
        required Size size,
        required VoidCallback onPressed}) =>
    SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.1, vertical: size.height * 0.02),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: borderColor, width: 1.5),
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
            ),
          )),
    );
