import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

Widget defaultAppBar({
  required Size size,
  required Widget title,
  List<Widget>? actions,
  required BuildContext context,
}) =>
    Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04, vertical: size.height * 0.06),
      child: Row(
        children: [
          SizedBox(width: size.width * 0.02),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: SvgPicture.asset(
              'assets/images/back.svg',
              height: size.height * 0.06,
              width: size.width * 0.06,
            ),
          ),
          const Spacer(),
          title,
          const Spacer(),
          if (actions != null) ...actions,
        ],
      ),
    );
