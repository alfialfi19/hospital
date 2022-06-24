import 'package:hospital/common/common.dart';

class Hospital extends BaseModel {
  final int? id;
  final String? name;
  final String? address;
  final String? hospitalClass;
  final String? phone;

  Hospital({
    this.id,
    this.name,
    this.address,
    this.hospitalClass,
    this.phone,
  }) : super({
          'id': id,
          'name': name,
          'address': address,
          'class': hospitalClass,
          'phone': phone,
        });

  factory Hospital.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('Null JSON provided');
    }

    return Hospital(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      hospitalClass: json['class'],
      phone: json['phone'],
    );
  }

  @override
  copyWith({
    int? id,
    String? name,
    String? address,
    String? hospitalClass,
    String? phone,
  }) {
    return Hospital(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      hospitalClass: hospitalClass ?? this.hospitalClass,
      phone: phone ?? this.phone,
    );
  }
}
