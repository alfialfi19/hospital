import 'package:hospital/common/common.dart';

class DoctorSchedule extends BaseModel {
  final int? id;
  final int? day;
  final String? startHour;
  final String? endHour;
  final int? quota;
  final Doctor? doctor;
  final Poly? poly;

  DoctorSchedule({
    this.id,
    this.day,
    this.startHour,
    this.endHour,
    this.quota,
    this.doctor,
    this.poly,
  }) : super({
          'id': id,
          'day': day,
          'start_hour': startHour,
          'end_hour': endHour,
          'quota': quota,
          'doctor': doctor,
          'poli': poly,
        });

  factory DoctorSchedule.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('Null JSON provided');
    }

    String startHour = json['start_hour'];
    String convertedStartHour = startHour.substring(0, 5);
    String endHour = json['end_hour'];
    String convertedEndHour = endHour.substring(0, 5);

    return DoctorSchedule(
      id: json['id'],
      day: json['day'],
      startHour: convertedStartHour,
      endHour: convertedEndHour,
      quota: json['quota'],
      doctor: Doctor.fromJson(json['doctor']),
      poly: Poly.fromJson(json['poli']),
    );
  }

  @override
  copyWith({
    int? id,
    int? day,
    String? startHour,
    String? endHour,
    int? quota,
    Doctor? doctor,
    Poly? poly,
  }) {
    return DoctorSchedule(
      id: id ?? this.id,
      day: day ?? this.day,
      startHour: startHour ?? this.startHour,
      endHour: endHour ?? this.endHour,
      quota: quota ?? this.quota,
      doctor: doctor ?? this.doctor,
      poly: poly ?? this.poly,
    );
  }
}
