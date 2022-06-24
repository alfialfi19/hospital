import 'package:hospital/common/common.dart';

class UserData extends BaseModel {
  final int? id;
  final String? email;
  final Hospital? hospital;
  final String? userType;

  UserData({
    this.id,
    this.email,
    this.hospital,
    this.userType,
  }) : super({
          "id": id,
          "email": email,
          "hospital": hospital,
          "user_type": userType,
        });

  factory UserData.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('Null JSON provided');
    }

    return UserData(
      id: json['id'],
      email: json['email'],
      hospital: Hospital.fromJson(json['hospital']),
      userType: json['user_type'],
    );
  }
  @override
  copyWith({
    int? id,
    String? email,
    Hospital? hospital,
    String? userType,
  }) {
    return UserData(
      id: id ?? this.id,
      email: email ?? this.email,
      hospital: hospital ?? this.hospital,
      userType: userType ?? this.userType,
    );
  }
}
