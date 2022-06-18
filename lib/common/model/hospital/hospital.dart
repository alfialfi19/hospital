import 'package:hospital/common/common.dart';

class Hospital extends BaseModel {
  final int? id;
  final String? email;
  final String? password;
  final String? hospitalClass;
  final String? phone;

  Hospital({
    this.id,
    this.email,
    this.password,
    this.hospitalClass,
    this.phone,
  }) : super({
          'id': id,
          'email': email,
          'password': password,
          'class': hospitalClass,
          'phone': phone,
        });

  factory Hospital.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('Null JSON provided');
    }

    return Hospital(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      hospitalClass: json['class'],
      phone: json['phone'],
    );
  }

  @override
  copyWith({
    int? id,
    String? email,
    String? password,
    String? hospitalClass,
    String? phone,
  }) {
    return Hospital(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      hospitalClass: hospitalClass ?? this.hospitalClass,
      phone: phone ?? this.phone,
    );
  }
}
