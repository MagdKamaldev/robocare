import 'package:flutter/cupertino.dart';

void navigateTo(context, widget) => Navigator.push(
    context,
    CupertinoPageRoute(
      builder: (context) => widget,
    ));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
        context, CupertinoPageRoute(builder: (context) => widget), (route) {
      return false;
    });
