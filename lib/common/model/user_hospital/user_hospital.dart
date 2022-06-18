import 'package:hospital/common/common.dart';

class UserHospital extends BaseModel {
  final String? nik;
  final String? name;
  final int? medicalRecord;
  final String? birthDate;
  final String? gender;
  final String? address;
  final String? phone;
  final UserData? userData;
  final String? userType;

  UserHospital({
    this.nik,
    this.name,
    this.medicalRecord,
    this.birthDate,
    this.gender,
    this.address,
    this.phone,
    this.userData,
    this.userType,
  }) : super({
          "nik": nik,
          "name": name,
          "medicalRecord": medicalRecord,
          "birthDate": birthDate,
          "gender": gender,
          "address": address,
          "phone": phone,
          "user": userData,
          "user_type": userType,
        });

  factory UserHospital.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('Null JSON provided');
    }

    return UserHospital(
      nik: json['nik'],
      name: json['name'],
      medicalRecord: json['medical_record'],
      birthDate: json['birth_date'],
      gender: json['gender'],
      address: json['address'],
      phone: json['phone'],
      userData: json['user'],
      userType: json['user_type'],
    );
  }

  @override
  copyWith({
    String? nik,
    String? name,
    int? medicalRecord,
    String? birthDate,
    String? gender,
    String? address,
    String? phone,
    UserData? userData,
    String? userType,
  }) {
    return UserHospital(
      nik: nik ?? this.nik,
      name: name ?? this.name,
      medicalRecord: medicalRecord ?? this.medicalRecord,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      userData: userData ?? this.userData,
      userType: userType ?? this.userType,
    );
  }
}
