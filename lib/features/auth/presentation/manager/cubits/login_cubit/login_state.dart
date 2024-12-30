import 'package:flutter/foundation.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String jwtToken;
  final String refreshToken;
  LoginSuccess(this.jwtToken, this.refreshToken);
}

class LoginError extends LoginState {
  final String message;
  LoginError(this.message);
}