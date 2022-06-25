import 'package:hospital/common/common.dart';

class Poly extends BaseModel {
  final int? id;
  final String? name;

  Poly({
    this.id,
    this.name,
  }) : super({
          'id': id,
          'name': name,
        });

  factory Poly.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('Null JSON provided');
    }

    return Poly(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  copyWith({
    int? id,
    String? name,
  }) {
    return Poly(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
