import 'package:flutter/material.dart';
import 'package:robocare/features/opening/presentation/opening_view.dart';

class RoboCareApp extends StatelessWidget {
  const RoboCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'RoboCare',
      home: OpeningView(),
    );
  }
}
