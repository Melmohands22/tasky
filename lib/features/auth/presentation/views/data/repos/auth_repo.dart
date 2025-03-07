import 'package:dartz/dartz.dart';
import 'package:tasky/core/utilis/errors.dart';
import 'package:tasky/features/auth/presentation/views/data/models/logInModel/log_in_model.dart';
import 'package:tasky/features/auth/presentation/views/data/models/signUpModel/sign_up.dart';

abstract class AuthRepo {
  Future<Either<Failure, SignUpModel>> userSignUp({
    required String phone,
    required String password,
    required String name,
    required int experienceYears,
    required String level,
    required String address,
  });
  Future<Either<Failure, LogInModel>> userLogIn({
    required String phone,
    required String password,
  });
}
