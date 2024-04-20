import 'package:flutter/material.dart';
import 'package:robocare/core/networks/dio_helper.dart';
import 'package:robocare/robocare_app.dart';

String? token = "";
void main() async {
  DioHelper.init();
  runApp(const RoboCareApp());
}
