import 'package:hospital/common/common.dart';

class Queue extends BaseModel {
  final DoctorSchedule? doctorSchedule;
  final int? queueNo;
  final String? date;

  Queue({
    this.doctorSchedule,
    this.queueNo,
    this.date,
  }) : super({
          'doctor_schedule': doctorSchedule,
          'queue_no': queueNo,
          'date': date,
        });

  factory Queue.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('Null JSON provided');
    }

    return Queue(
      doctorSchedule: DoctorSchedule.fromJson(json['doctor_schedule']),
      queueNo: json['queue_no'],
      date: json['date'],
    );
  }

  @override
  copyWith({
    DoctorSchedule? doctorSchedule,
    int? queueNo,
    String? date,
  }) {
    return Queue(
      doctorSchedule: doctorSchedule ?? this.doctorSchedule,
      queueNo: queueNo ?? this.queueNo,
      date: date ?? this.date,
    );
  }
}
