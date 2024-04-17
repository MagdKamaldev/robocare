import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:robocare/core/widgets/default_app_bar.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          defaultAppBar(
            context: context,
            size: size,
            title: Container(),
            actions: [
              SvgPicture.asset(
                'assets/images/star.svg',
                height: size.height * 0.06,
                width: size.width * 0.06,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
