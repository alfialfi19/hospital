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
    print("===> enter fromjson");
    print("===> enter json: $json");
    if (json == null) {
      throw const FormatException('Null JSON provided');
    }
    print("===> userData: ${json['user']}");
    var _tes = UserHospital(
      nik: json['nik'],
      name: json['name'],
      medicalRecord: json['medical_record'],
      birthDate: json['birth_date'],
      gender: json['gender'],
      address: json['address'],
      phone: json['phone'],
      userData: UserData.fromJson(json['user']),
    );
    print("===> tes: $_tes");
    print("===> tes nik: ${_tes.nik}");
    print("===> tes name: ${_tes.name}");
    print("===> tes medical: ${_tes.medicalRecord}");
    print("===> tes birth: ${_tes.birthDate}");
    print("===> tes gender: ${_tes.gender}");
    print("===> tes address: ${_tes.address}");
    print("===> tes phone: ${_tes.phone}");
    print("===> tes userData: ${_tes.userData}");

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
