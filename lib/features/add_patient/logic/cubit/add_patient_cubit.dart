// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robocare/core/models/patient/patient/patient.dart';
import 'package:robocare/core/networks/cache_helper.dart';
import 'package:robocare/core/networks/dio_helper.dart';
import 'package:robocare/core/widgets/show_snack_bar.dart';
part 'add_patient_state.dart';

class AddPatientCubit extends Cubit<AddPatientState> {
  AddPatientCubit() : super(AddPatientInitial());
  static AddPatientCubit get(context) => BlocProvider.of(context);

  Patient? patient;

  void addPatient({
    required String name,
    required int age,
    required String gender,
    required String diagnotics,
    required String medicalProblem,
    required BuildContext context,
  }) {
    emit(AddPatientLoading());
    DioHelper.postAuthorized(
            url: "patients",
            data: {
              "data": {
                "Name": name,
                "Age": age,
                "Gender": gender,
                "Dignosis": diagnotics,
                "Medical_problem": medicalProblem
              }
            },
            jwt: CacheHelper.getData(key: "token"))
        .then((value) {
      patient = Patient.fromJson(value.data["data"]);
      emit(AddPatientSuccess(patient!));
    }).catchError((error) {
      emit(AddPatientError(error.toString()));
      if (error is DioError) {
        showCustomSnackBar(
            context, error.response!.data["error"]["message"], Colors.red);
        return;
      }
    });
  }
}
