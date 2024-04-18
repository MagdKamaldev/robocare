import 'package:flutter/material.dart';
import 'package:material_color_gen/material_color_gen.dart';
import 'package:robocare/core/themes/colors.dart';
import 'package:robocare/features/opening/presentation/opening_view.dart';

class RoboCareApp extends StatelessWidget {
  const RoboCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: ColorManager.primary.toMaterialColor(),
      ),
      title: 'RoboCare',
      home: const OpeningView(),
    );
  }
}
