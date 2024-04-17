import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:robocare/core/themes/colors.dart';
import 'package:robocare/core/widgets/default_button.dart';

class OpeningView extends StatelessWidget {
  const OpeningView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.01, vertical: size.height * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/welcome.png',
            height: size.height * 0.6,
          ),
          DefaultButton(
              title: "Sign In",
              backgroundColor: ColorManager.primary,
              textColor: Colors.white,
              borderColor: ColorManager.primary,
              width: size.width * 0.9,
              height: size.height * 0.075),
          SizedBox(
            height: size.height * 0.03,
          ),
          DefaultButton(
              title: "Create account",
              backgroundColor: Colors.white,
              textColor: ColorManager.primary,
              borderColor: ColorManager.primary,
              width: size.width * 0.9,
              height: size.height * 0.075),
        ],
      ),
    ));
  }
}
