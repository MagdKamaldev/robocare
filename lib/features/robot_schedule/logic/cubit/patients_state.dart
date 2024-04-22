part of 'patients_cubit.dart';

sealed class PatientsState {}

final class PatientsInitial extends PatientsState {}

class PatientsLoading extends PatientsState {}

class PatientsError extends PatientsState {
  final String error;
  PatientsError(this.error);
}

class PatientsSuccess extends PatientsState {
  final List<Patient> patients;
  PatientsSuccess(this.patients);
}
