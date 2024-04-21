import 'package:flutter/material.dart';
import 'package:robocare/core/networks/cache_helper.dart';
import 'package:robocare/core/networks/dio_helper.dart';
import 'package:robocare/robocare_app.dart';

String? token = "";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  runApp(const RoboCareApp());
}
