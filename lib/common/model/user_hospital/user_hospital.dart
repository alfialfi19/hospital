import 'package:hospital/common/common.dart';

class UserHospital extends BaseModel {
  final String? nik;
  final String? name;
  final String? medicalRecord;
  final String? birthDate;
  final String? gender;
  final String? address;
  final String? phone;
  final UserData? userData;

  UserHospital({
    this.nik,
    this.name,
    this.medicalRecord,
    this.birthDate,
    this.gender,
    this.address,
    this.phone,
    this.userData,
  }) : super({
          "nik": nik,
          "name": name,
          "medical_record": medicalRecord,
          "birth_date": birthDate,
          "gender": gender,
          "address": address,
          "phone": phone,
          "user": userData,
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
      userData: UserData.fromJson(json['user']),
    );
  }

  @override
  copyWith({
    String? nik,
    String? name,
    String? medicalRecord,
    String? birthDate,
    String? gender,
    String? address,
    String? phone,
    UserData? userData,
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
    );
  }
}
