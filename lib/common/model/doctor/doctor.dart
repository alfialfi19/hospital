import 'package:hospital/common/common.dart';

class Doctor extends BaseModel {
  final String? name;
  final String? gender;

  Doctor({
    this.name,
    this.gender,
  }) : super({
          'name': name,
          'gender': gender,
        });

  factory Doctor.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('Null JSON provided');
    }

    return Doctor(
      name: json['name'],
      gender: json['gender'],
    );
  }

  @override
  copyWith({
    String? name,
    String? gender,
  }) {
    return Doctor(
      name: name ?? this.name,
      gender: gender ?? this.gender,
    );
  }
}
