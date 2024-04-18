import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:robocare/core/themes/colors.dart';
import 'package:robocare/core/widgets/default_app_bar.dart';
import 'package:robocare/core/widgets/default_button.dart';
import 'package:robocare/core/widgets/default_form_field.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            defaultAppBar(
              context: context,
              size: size,
              title: Container(),
              actions: [
                SvgPicture.asset(
                  'assets/images/Star.svg',
                  height: size.height * 0.06,
                  width: size.width * 0.06,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Text(
                    "Create Account",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: ColorManager.primary),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  defaultFormField(
                      title: "Email",
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      suffix: Icons.done,
                      onSubmit: () {},
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      isPassword: false,
                      label: 'example@gmail.com',
                      context: context),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  defaultFormField(
                      title: "Create a Password",
                      suffix: Icons.visibility_off_outlined,
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      onSubmit: () {},
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      isPassword: true,
                      label: 'must not be empty',
                      context: context),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  defaultFormField(
                      title: "Create a Password",
                      suffix: Icons.visibility_off_outlined,
                      controller: confirmPasswordController,
                      type: TextInputType.visiblePassword,
                      onSubmit: () {},
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      isPassword: true,
                      label: 'must not be empty',
                      context: context),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  DefaultButton(
                      title: "Sign up",
                      backgroundColor: ColorManager.primary,
                      textColor: Colors.white,
                      borderColor: ColorManager.primary,
                      width: double.infinity,
                      height: size.height * 0.07,
                      onPressed: () {}),
                  SizedBox(
                    height: size.height * 0.15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account ?",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          )),
                      Text("  Log in",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.primary,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
