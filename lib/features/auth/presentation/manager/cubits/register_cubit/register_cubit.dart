import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:tasky/features/auth/presentation/manager/cubits/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final Dio _dio = Dio();

  String? _jwtToken;
  String? _refreshToken;

  Future<void> registerUser({
    required String phone,
    required String password,
    required String displayName,
    required int experienceYears,
    required String address,
    required String level,
  }) async {
    emit(RegisteLoading());
    try {
      final response = await _dio.post(
        'https://todo.iraqsapp.com/auth/register',
        data: {
          "phone": phone,
          "password": password,
          "displayName": displayName,
          "experienceYears": experienceYears,
          "address": address,
          "level": level,
        },
      );

      if (response.statusCode == 200) {
        _jwtToken = response.data['jwtToken'];
        _refreshToken = response.data['refreshToken'];
        emit(RegisteSuccess());
      } else {
        emit(RegisteError(response.data['message'] ?? "Registration failed"));
      }
    } catch (e) {
      emit(RegisteError("Something went wrong: $e"));
    }
  }
}
