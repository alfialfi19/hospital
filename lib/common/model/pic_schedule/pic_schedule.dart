import 'package:hospital/common/common.dart';

class PicSchedule extends BaseModel {
  final int? id;
  final int? day;
  final String? startHour;
  final String? endHour;
  final int? quota;
  final Doctor? doctor;

  PicSchedule({
    this.id,
    this.day,
    this.startHour,
    this.endHour,
    this.quota,
    this.doctor,
  }) : super({
          'id': id,
          'day': day,
          'start_hour': startHour,
          'end_hour': endHour,
          'quota': quota,
          'doctor': doctor,
        });

  factory PicSchedule.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('Null JSON provided');
    }

    String startHour = json['start_hour'] ?? "0000-00-00";
    String convertedStartHour = startHour.substring(0, 5);
    String endHour = json['end_hour'] ?? "0000-00-00";
    String convertedEndHour = endHour.substring(0, 5);

    return PicSchedule(
      id: json['id'],
      day: json['day'],
      startHour: convertedStartHour,
      endHour: convertedEndHour,
      quota: json['quota'],
      doctor: Doctor.fromJson(json['doctor']),
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
  }) {
    return PicSchedule(
      id: id ?? this.id,
      day: day ?? this.day,
      startHour: startHour ?? this.startHour,
      endHour: endHour ?? this.endHour,
      quota: quota ?? this.quota,
      doctor: doctor ?? this.doctor,
    );
  }
}
