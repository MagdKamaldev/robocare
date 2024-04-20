import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robocare/core/models/user/user.dart';
import 'package:robocare/core/navigation.dart';
import 'package:robocare/core/networks/dio_helper.dart';
import 'package:robocare/core/widgets/show_snack_bar.dart';
import 'package:robocare/features/home/presentation/home_view.dart';
import 'package:robocare/main.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);

  IconData passsuffix = Icons.visibility_outlined;
  bool passisPassword = true;

  void changePassword() {
    passisPassword = !passisPassword;
    passsuffix = passisPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }

  IconData confirmsuffix = Icons.visibility_outlined;
  bool confirmisPassword = true;

  void changeconfirmPassword() {
    confirmisPassword = !confirmisPassword;
    confirmsuffix = confirmisPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }

  User? user;

  void signUp({
    required String email,
    required String name,
    required String username,
    required String password,
    required BuildContext context,
  }) {
    emit(SignUpLoading());
    DioHelper.postData(url: "register", data: {
      "email": email,
      "name": name,
      "username": username,
      "password": password,
    }).then((value) {
      user = User.fromJson(value.data["user"]);
      token = value.data["jwt"];
      navigateAndFinish(context, const HomeView());
    }).catchError((error) {
      showCustomSnackBar(context, error.toString(), Colors.red);
      emit(SignUpError(error.toString()));
    });
  }
}
