import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/core/utilis/app_strings.dart';
import 'package:tasky/core/utilis/globals.dart' as globals;
import 'package:tasky/core/utilis/helpers.dart';
import 'package:tasky/features/auth/presentation/views/data/models/signUpModel/sign_up.dart';
import 'package:tasky/core/utilis/end_points.dart';

class AppIntercepters extends Interceptor {
  final Dio client;
  final SharedPreferences sharedPreferences;

  const AppIntercepters({required this.client, required this.sharedPreferences});

  Future<SignUpModel?> _refreshToken() async {
    if (globals.accessToken == null || globals.refreshToken == null) {
      return null;
    }
    final response =
        await client.post(EndPoint.refreshToken(globals.refreshToken), data: {
      AppStrings.accessToken: globals.accessToken,
      AppStrings.refreshToken: globals.refreshToken,
    });
    Helpers.printOnlyInDebug("_refreshToken => response $response");
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.data.toString());
      final authenticate = SignUpModel.fromJason(jsonData);
      final bool isSaved = await _saveToken(authenticate);
      if (isSaved) {
        return authenticate;
      }
      return null;
    } else {
      return null;
    }
  }

  Future<bool> _saveToken(SignUpModel authenticate) async {
    await sharedPreferences.setString(
        AppStrings.accessToken, authenticate.accessToken);
    await sharedPreferences.setString(
        AppStrings.refreshToken, authenticate.refreshToken);
    return true;
  }
}
