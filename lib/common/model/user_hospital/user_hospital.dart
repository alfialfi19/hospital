import 'package:hospital/common/common.dart';

class UserHospital extends BaseModel {
  final String? email;
  final String? username;
  final String? fullName;

  UserHospital({
    this.email,
    this.username,
    this.fullName,
  }) : super({
          "email": email,
          "username": username,
          "fullName": fullName,
        });

  factory UserHospital.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('Null JSON provided');
    }

    return UserHospital(
      email: json['email'],
      username: json['username'],
      fullName: json['fullName'],
    );
  }

  @override
  copyWith({
    String? email,
    String? username,
    String? fullName,
  }) {
    return UserHospital(
      email: email ?? this.email,
      username: username ?? this.username,
      fullName: fullName ?? this.fullName,
    );
  }
}
