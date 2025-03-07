import 'package:flutter/foundation.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisteLoading extends RegisterState {}

class RegisteSuccess extends RegisterState {}

class RegisteError extends RegisterState {
   final String message;

  RegisteError( {required this.message});
}

class AuthRefreshed extends RegisterState {}

class AuthUnauthorized extends RegisterState {}

class AuthRefreshFailed extends RegisterState {}
