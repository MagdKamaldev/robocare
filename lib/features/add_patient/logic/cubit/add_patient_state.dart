part of 'add_patient_cubit.dart';

sealed class AddPatientState {}

final class AddPatientInitial extends AddPatientState {}

class AddPatientLoading extends AddPatientState {}

class AddPatientError extends AddPatientState {
  final String error;
  AddPatientError(this.error);
}

class AddPatientSuccess extends AddPatientState {
  final Patient patient;
  AddPatientSuccess(this.patient);
}
