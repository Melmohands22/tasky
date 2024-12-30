import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/features/auth/presentation/manager/cubits/login_cubit/login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  final Dio _dio = Dio();
  String? _jwtToken;
  String? _refreshToken;

  LoginCubit() : super(LoginInitial());

  Future<void> login(String phone, String password) async {
    emit(LoginLoading());

    try {
      final response = await _dio.post(
        'https://todo.iraqsapp.com/auth/login',
        data: {
          "phone": phone,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        _jwtToken = response.data['jwtToken'];
        _refreshToken = response.data['refreshToken'];
        emit(LoginSuccess(_jwtToken!, _refreshToken!));
      } else {
        emit(LoginError("Login failed with status code ${response.statusCode}"));
      }
    } catch (e) {
      emit(LoginError("Login error: $e"));
    }
  }

  String? get jwtToken => _jwtToken;
  String? get refreshToken => _refreshToken;
}
