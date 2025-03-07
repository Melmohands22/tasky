class SignUpModel {
  final String id;
  final String displayName;
  final String accessToken;
  final String refreshToken;

  SignUpModel(
      {required this.id,
      required this.displayName,
      required this.accessToken,
      required this.refreshToken});

  factory SignUpModel.fromJason(Map<String, dynamic> data) => SignUpModel(
        id: data['_id'],
        displayName: data['displayName'],
        accessToken: data['access_token'],
        refreshToken: data['refresh_token'],
      );
}
class RefreshTokenModel {
  final String token;

  RefreshTokenModel({required this.token});

  factory RefreshTokenModel.fromJson(Map<String, dynamic> json) {
    return RefreshTokenModel(
      token: json['token'] as String,
    );
  }
}
