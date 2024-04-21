// ignore_for_file: use_key_in_widget_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:robocare/core/navigation.dart';
import 'package:robocare/core/themes/colors.dart';
import 'package:robocare/core/widgets/default_app_bar.dart';
import 'package:robocare/core/widgets/default_button.dart';
import 'package:robocare/core/widgets/default_form_field.dart';
import 'package:robocare/features/login/logic/cubit/login_cubit.dart';
import 'package:robocare/features/sign_up/presentation/sign_up_view.dart';

class LoginView extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
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
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      const Text(
                        "Log in",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: ColorManager.primary),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      defaultFormField(
                          title: "Email address",
                          controller: emailController,
                          type: TextInputType.emailAddress,
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
                          title: "Password",
                          suffix: LoginCubit.get(context).passsuffix,
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          onSubmit: () {},
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          suffixPressed: () {
                            LoginCubit.get(context).changePassword();
                          },
                          isPassword: LoginCubit.get(context).passisPassword,
                          label: 'must not be empty',
                          context: context),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      const Align(
                        alignment: Alignment.topRight,
                        child: Text("Forgot password ?",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            )),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      if (state is! LoginLoading)
                        defaultButton(
                            title: "Log in",
                            backgroundColor: ColorManager.primary,
                            textColor: Colors.white,
                            borderColor: ColorManager.primary,
                            width: double.infinity,
                            height: size.height * 0.07,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context).login(
                                    context: context,
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                            size: size),
                      if (state is LoginLoading)
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                      SizedBox(
                        height: size.height * 0.2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account ?",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              )),
                          TextButton(
                            onPressed: () {
                              navigateTo(context, SignUpView());
                            },
                            child: const Text("  Sign Up",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.primary,
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
