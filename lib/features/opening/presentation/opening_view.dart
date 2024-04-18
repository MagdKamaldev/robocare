import 'package:flutter/material.dart';
import 'package:robocare/core/navigation.dart';
import 'package:robocare/core/themes/colors.dart';
import 'package:robocare/core/widgets/default_button.dart';
import 'package:robocare/features/login/presentation/login_view.dart';
import 'package:robocare/features/sign_up/presentation/sign_up_view.dart';

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
              onPressed: () {
                navigateTo(context, const LoginView());
              },
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
              onPressed: () {
                navigateTo(context, const SignUpView());
              },
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
