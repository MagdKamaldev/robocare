// ignore_for_file: use_key_in_widget_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:robocare/core/navigation.dart';
import 'package:robocare/core/themes/colors.dart';
import 'package:robocare/core/widgets/default_app_bar.dart';
import 'package:robocare/core/widgets/default_button.dart';
import 'package:robocare/core/widgets/default_form_field.dart';
import 'package:robocare/core/widgets/show_snack_bar.dart';
import 'package:robocare/features/login/presentation/login_view.dart';
import 'package:robocare/features/sign_up/logic/cubit/sign_up_cubit.dart';

class SignUpView extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          navigateTo(context, const LoginView());
        } else if (state is SignUpError) {
          showCustomSnackBar(context, state.message, Colors.red);
        }
      },
      builder: (context, state) {
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
                      height: size.height * 0.04,
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
                        const Text(
                          "Create Account",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.primary),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        defaultFormField(
                            title: "User Name",
                            controller: nameController,
                            type: TextInputType.emailAddress,
                            onSubmit: () {},
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                            isPassword: false,
                            label: 'john doe',
                            context: context),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        defaultFormField(
                            title: "Email",
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
                            suffixPressed: () {
                              SignUpCubit.get(context).changePassword();
                            },
                            title: "Create a Password",
                            suffix: SignUpCubit.get(context).passsuffix,
                            isPassword: SignUpCubit.get(context).passisPassword,
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            onSubmit: () {},
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            label: 'must not be empty',
                            context: context),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        defaultFormField(
                            title: "Confirm Password",
                            suffixPressed: () {
                              SignUpCubit.get(context).changeconfirmPassword();
                            },
                            suffix: SignUpCubit.get(context).confirmsuffix,
                            controller: confirmPasswordController,
                            type: TextInputType.visiblePassword,
                            onSubmit: () {},
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter your password';
                              } else if (value != passwordController.text) {
                                return 'Password does not match';
                              }
                              return null;
                            },
                            isPassword:
                                SignUpCubit.get(context).confirmisPassword,
                            label: 'must not be empty',
                            context: context),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        if (state is! SignUpLoading)
                          defaultButton(
                              title: "Sign up",
                              backgroundColor: ColorManager.primary,
                              textColor: Colors.white,
                              borderColor: ColorManager.primary,
                              width: double.infinity,
                              height: size.height * 0.07,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  SignUpCubit.get(context).signUp(
                                    context: context,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text,
                                    username: emailController.text,
                                  );
                                }
                              },
                              size: size),
                        if (state is SignUpLoading)
                          const Center(child: CircularProgressIndicator()),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account ?",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                )),
                            TextButton(
                                onPressed: () {
                                  navigateTo(context, const LoginView());
                                },
                                child: const Text("  Log in",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: ColorManager.primary,
                                    ))),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
