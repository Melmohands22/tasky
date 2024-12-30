import 'package:flutter/foundation.dart';

@immutable
abstract class RefreshState {}

class RefreshInitial extends RefreshState {}

class RefreshLoading extends RefreshState {}

class RefreshSuccess extends RefreshState {
  final String jwtToken;
  RefreshSuccess(this.jwtToken);
}
class RefreshError extends RefreshState {
  final String message;
  RefreshError(this.message);
}