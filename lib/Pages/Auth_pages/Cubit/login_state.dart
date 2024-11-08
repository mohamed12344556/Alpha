import 'package:flutter/foundation.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String error;
  LoginFailure(this.error);
}

class PasswordVisibilityToggled extends LoginState {
  final bool isVisible;
  PasswordVisibilityToggled({required this.isVisible});
}
