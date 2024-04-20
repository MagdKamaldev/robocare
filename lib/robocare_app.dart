import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_color_gen/material_color_gen.dart';
import 'package:robocare/core/themes/colors.dart';
import 'package:robocare/features/opening/presentation/opening_view.dart';
import 'package:robocare/features/sign_up/logic/cubit/sign_up_cubit.dart';

class RoboCareApp extends StatelessWidget {
  const RoboCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignUpCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: ColorManager.primary.toMaterialColor(),
            iconTheme: const IconThemeData(color: ColorManager.primary)),
        title: 'RoboCare',
        home: const OpeningView(),
      ),
    );
  }
}
