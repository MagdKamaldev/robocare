import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robocare/core/models/patient/patient/patient.dart';
import 'package:robocare/core/networks/cache_helper.dart';
import 'package:robocare/core/networks/dio_helper.dart';
part 'patients_state.dart';

class PatientsCubit extends Cubit<PatientsState> {
  PatientsCubit() : super(PatientsInitial());
  static PatientsCubit get(context) => BlocProvider.of(context);

  void getPatients() {
    emit(PatientsLoading());
    DioHelper.getData(
      url: "patients",
      jwt: CacheHelper.getData(key: "token"),
    ).then((value) {
      List<Patient> patients = [];
      value.data["data"].forEach((element) {
        patients.add(Patient.fromJson(element));
      });
      emit(PatientsSuccess(patients));
    }).catchError((error) {
      emit(PatientsError(error.toString()));
    });
  }
}
