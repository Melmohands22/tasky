import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tasky/core/utilis/api_service.dart';
import 'package:tasky/core/utilis/dio.dart';
import 'package:tasky/features/auth/presentation/views/data/repos/auth_repo_impl.dart';
import 'package:tasky/features/auth/presentation/views/data/repos/auth_repo.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<ApiService>(() => DioService(dio: Dio()));
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(getIt<DioService>() , getIt<ApiService>()));
}

