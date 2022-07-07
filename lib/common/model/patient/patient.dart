import 'package:hospital/common/common.dart';

class Patient extends BaseModel {
  final String? name;
  final String? gender;

  Patient({
    this.name,
    this.gender,
  }) : super({
          'name': name,
          'gender': gender,
        });

  factory Patient.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('Null JSON provided');
    }

    return Patient(
      name: json['name'],
      gender: json['gender'],
    );
  }

  @override
  copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }
}
