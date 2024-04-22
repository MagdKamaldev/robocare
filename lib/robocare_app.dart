import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_color_gen/material_color_gen.dart';
import 'package:robocare/core/networks/cache_helper.dart';
import 'package:robocare/core/themes/colors.dart';
import 'package:robocare/features/add_patient/logic/cubit/add_patient_cubit.dart';
import 'package:robocare/features/login/logic/cubit/login_cubit.dart';
import 'package:robocare/features/opening/presentation/opening_view.dart';
import 'package:robocare/features/robot_schedule/logic/cubit/patients_cubit.dart';
import 'package:robocare/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:robocare/main.dart';

class RoboCareApp extends StatelessWidget {
  const RoboCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    token = CacheHelper.getData(key: "token");
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignUpCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => AddPatientCubit()),
        BlocProvider(create: (context) => PatientsCubit()..getPatients()),
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
