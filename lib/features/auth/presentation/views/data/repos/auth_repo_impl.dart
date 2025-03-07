
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:tasky/core/utilis/api_service.dart';
import 'package:tasky/core/utilis/dio.dart';
import 'package:tasky/core/utilis/end_points.dart';
import 'package:tasky/core/utilis/errors.dart';
import 'package:tasky/core/utilis/shared_prefrences.dart';
import 'package:tasky/features/auth/presentation/views/data/models/logInModel/log_in_model.dart';
import 'package:tasky/features/auth/presentation/views/data/models/signUpModel/sign_up.dart';
import 'package:tasky/features/auth/presentation/views/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
    final ApiService apiService;
AuthRepoImpl(this.dio, this.apiService);
  final DioService dio;
  
  @override
  Future<Either<Failure, SignUpModel>> userSignUp({
    required String phone,
    required String password,
    required String name,
    required int experienceYears,
    required String address,
    required String level,
  }) async {
    var response = await dio.post(
      '${EndPoint.baseUrl}${EndPoint.register}',
      data: {
        ApiKeys.phone: phone,
        ApiKeys.password: password,
        ApiKeys.displayName: name,
        ApiKeys.experienceYears: experienceYears,
        ApiKeys.address: address,
        ApiKeys.level: level
      },
    );
    return response.fold(
      (failure) => left(failure),
      (signUpData) {
        final signUpModel = SignUpModel.fromJason(signUpData);
        return right(signUpModel);
      },
    );
  }

  @override
  Future<Either<Failure, LogInModel>> userLogIn(
      {required String phone, required String password}) async {
    final response = await dio.post(
      '${EndPoint.baseUrl}${EndPoint.login}',
      data: {
        ApiKeys.phone: phone,
        ApiKeys.password: password,
      },
    );

    return response.fold(
      (failure) => left(failure),
      (logInData) async {
        final logInModel = LogInModel.fromJason(logInData);
        await ShPref.saveAccessToken(logInModel.accessToken);
        await ShPref.saveRefreshToken(logInModel.refreshToken);
        String token = await ShPref.getAccessToken();
        log(token);
        return right(logInModel);
      },
    );
  }
}
