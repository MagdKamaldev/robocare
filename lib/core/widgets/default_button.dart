import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final double width;
  final double height;
  final Function onPressed;
  const DefaultButton(
      {super.key,
      required this.title,
      required this.backgroundColor,
      required this.textColor,
      required this.borderColor,
      required this.width,
      required this.height,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          onPressed: () {
            onPressed();
          },
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
  }
}
