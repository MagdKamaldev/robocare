import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OpeningView extends StatelessWidget {
  const OpeningView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SvgPicture.asset(
      'assets/images/welcome.svg',
      width: 200,
      height: 200,
    ));
  }
}
