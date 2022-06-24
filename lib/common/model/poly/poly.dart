import 'package:hospital/common/common.dart';

class Poly extends BaseModel {
  final String? name;

  Poly({
    this.name,
  }) : super({
          'name': name,
        });

  factory Poly.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('Null JSON provided');
    }

    return Poly(
      name: json['name'],
    );
  }

  @override
  copyWith({String? name}) {
    return Poly(
      name: name ?? this.name,
    );
  }
}
