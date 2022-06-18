import 'package:hospital/common/common.dart';

class UserData extends BaseModel {
  final int? id;
  final String? email;
  final Hospital? hospital;

  UserData({this.id, this.email, this.hospital})
      : super({
          "id": id,
          "email": email,
          "hospital": hospital,
        });

  factory UserData.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('Null JSON provided');
    }

    return UserData(
      id: json['id'],
      email: json['email'],
      hospital: json['hospital'],
    );
  }
  @override
  copyWith({
    int? id,
    String? email,
    Hospital? hospital,
  }) {
    return UserData(
      id: id ?? this.id,
      email: email ?? this.email,
      hospital: hospital ?? this.hospital,
    );
  }
}
