import 'package:hospital/common/common.dart';

class Token extends BaseModel {
  final String? accessToken;
  final String? refreshToken;

  Token({
    this.accessToken,
    this.refreshToken,
  }) : super({
          'access_token': accessToken,
          'refresh_token': refreshToken,
        });

  factory Token.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('Null JSON provided');
    }

    return Token(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }

  @override
  copyWith({
    String? accessToken,
    String? refreshToken,
  }) {
    return Token(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }
}
