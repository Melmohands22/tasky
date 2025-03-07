import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasky/core/utilis/api_service.dart';
import 'package:tasky/core/utilis/errors.dart';
import 'package:tasky/core/utilis/shared_prefrences.dart';
import 'package:tasky/features/auth/presentation/views/data/models/signUpModel/sign_up.dart';

class DioService extends ApiService {
  final Dio dio;
  bool isRefreshing = false;
  String? newToken;

  DioService({required this.dio}) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final accessToken = await ShPref.getAccessToken();
        options.headers["Authorization"] = "Bearer $accessToken";
        return handler.next(options);
      },
      onResponse: (response, handler) => handler.next(response),
      onError: (DioException err, handler) async {
        log("Error: ${err.message}");
        log("Request Path: ${err.requestOptions.path}");
        final requestPath = err.requestOptions.path;

        if (err.response?.statusCode == 401 && requestPath.contains("auth")) {
          return handler.next(DioException(
            requestOptions: err.requestOptions,
            error: Serverfailure.fromDioError(err),
          ));
        }

        if (err.response?.statusCode == 401 && !isRefreshing) {
          isRefreshing = true;
          bool tokenRefreshed = await refreshToken();
          isRefreshing = false;

          if (tokenRefreshed) {
            final opts = err.requestOptions;
            opts.headers["Authorization"] = "Bearer $newToken";
            return handler.resolve(await _retry(opts));
          } else {
            return handler.next(DioException(
              requestOptions: err.requestOptions,
              error: Serverfailure.fromDioError(err),
            ));
          }
        }

        return handler.next(DioException(
          requestOptions: err.requestOptions,
          error: Serverfailure.fromDioError(err),
        ));
      },
    ));
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  @override
  Future<Either<Failure, dynamic>> get(String path,
      {Object? data, Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters}) async {
    return _safeRequest(() => dio.get(
          path,
          data: data,
          options: Options(headers: headers),
          queryParameters: queryParameters,
        ));
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> delete(String path,
      {Object? data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, bool isFromData = false}) async {
    return _safeRequest(() => dio.delete(
          path,
          data: data,
          options: Options(headers: headers),
        ));
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> post(String path,
      {Object? data, Map<String, dynamic>? headers, FormData? formData, bool isFromData = false}) async {
    return _safeRequest(() => dio.post(
          path,
          data: isFromData ? formData : data,
          options: Options(headers: headers),
        ));
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> put(String path,
      {Object? data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, bool isFromData = false}) async {
    return _safeRequest(() => dio.put(
          path,
          data: data,
          options: Options(headers: headers),
        ));
  }

  Future<bool> refreshToken() async {
    final refreshToken = await ShPref.getrefreshToken();
    final queryParameters = {'token': refreshToken};

    try {
      final Response response = await dio.get(
        'https://todo.iraqsapp.com/auth/refresh-token?',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        final token = RefreshTokenModel.fromJson(response.data);
        log("New Token: ${token.token}");
        await ShPref.saveAccessToken(token.token);
        newToken = token.token;
        return true;
      } else {
        log("Failed to refresh token, status code: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      log("Error while refreshing token: $e");
      return false;
    }
  }

  Future<Either<Failure, T>> _safeRequest<T>(Future<Response> Function() request) async {
    try {
      final response = await request();
      return right(response.data);
    } on DioException catch (e) {
      return left(Serverfailure.fromDioError(e));
    }
  }
}
