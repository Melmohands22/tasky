import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/features/auth/presentation/manager/cubits/refresh_cubit/refresh_state.dart'; // Import the correct state file

class RefreshCubit extends Cubit<RefreshState> {
  final Dio dio = Dio();
  String? _jwtToken;
  String? refreshToken;

  RefreshCubit() : super(RefreshInitial());

  Future<void> refreshJwtToken(String token) async {
    emit(RefreshLoading());

    try {
      final response = await dio.get(
        'https://todo.iraqsapp.com/auth/refresh-token',
        queryParameters: {
          'token': token,
        },
      );

      if (response.statusCode == 200) {
        _jwtToken = response.data['jwtToken'];
        emit(RefreshSuccess(_jwtToken!));
      } else if (response.statusCode == 401) {
        emit(RefreshError("Unauthorized. Please log in again."));
      } else if (response.statusCode == 403) {
        emit(RefreshError("Failed to refresh token. Please try again."));
      }
    } catch (e) {
      emit(RefreshError("Error refreshing token: $e"));
    }
  }

  String? get jwtToken => _jwtToken;
}