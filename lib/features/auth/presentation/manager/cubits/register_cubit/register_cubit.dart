import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:tasky/features/auth/presentation/manager/cubits/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final Dio _dio = Dio();

  Future<void> signUp(
    String phone,
    String password,
    String displayName,
    int experienceYears,
    String address,
    String level,
  ) async {
    emit(RegisteLoading());

    try {
      final data = {
        "phone": phone,
        "password": password,
        "displayName": displayName,
        "experienceYears": experienceYears,
        "address": address,
        "level": level,
      };

      print("Request URL: https://todo.iraqsapp.com/auth/register");
      print("Request Data: $data");

      final response = await _dio.post(
        "https://todo.iraqsapp.com/auth/register",
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      print("Response Status Code: ${response.statusCode}");
      print("Response Data: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data['status'] == true) {
          emit(RegisteSuccess());
        } else {
          emit(RegisteError(message: response.data['message']));
        }
      } else if (response.statusCode == 422) {
        // Log the full response for debugging
        print("Validation Error: ${response.data}");
        emit(RegisteError(message: response.data['message']));
      } else {
        emit(RegisteError(message: 'Server error: ${response.statusCode}'));
      }
    } catch (e) {
      if (e is DioException) {
        print("Error: ${e.response?.statusCode} - ${e.response?.data}");
      }
      emit(RegisteError(message: e.toString()));
    }
  }
}
