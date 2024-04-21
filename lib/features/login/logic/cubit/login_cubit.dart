import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robocare/core/navigation.dart';
import 'package:robocare/core/networks/dio_helper.dart';
import 'package:robocare/core/widgets/show_snack_bar.dart';
import 'package:robocare/features/home/presentation/home_view.dart';
import 'package:robocare/main.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  IconData passsuffix = Icons.visibility_outlined;
  bool passisPassword = true;

  void changePassword() {
    passisPassword = !passisPassword;
    passsuffix = passisPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }

  void login({
    required String email,
    required String password,
    required BuildContext context,
  }) {
    emit(LoginLoading());
    DioHelper.postData(url: "auth/local", data: {
      "identifier": email,
      "password": password,
    }).then((value) {
      token = value.data["jwt"];
      navigateAndFinish(context, const HomeView());
    }).catchError((error) {
      showCustomSnackBar(context, error.toString(), Colors.red);
      emit(LoginError(error.toString()));
    });
  }
}
