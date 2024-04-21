part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String message;

  LoginSuccess(this.message);
}

class LoginError extends LoginState {
  final String message;

  LoginError(this.message);
}

class ChangePasswordVisibilityState extends LoginState {}
