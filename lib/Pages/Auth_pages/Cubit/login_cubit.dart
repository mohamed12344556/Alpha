import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void logIn(String email, String password) async {
    emit(LoginLoading());
    try {
      await Future.delayed(Duration(seconds: 1));
      if (email.isNotEmpty && password.isNotEmpty) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure("Email and password cannot be empty"));
      }
    } catch (e) {
      emit(LoginFailure("Something went wrong"));
    }
  }

  void togglePasswordVisibility(bool isVisible) {
    emit(PasswordVisibilityToggled(isVisible: !isVisible));
  }
}
