import 'package:hospital/common/common.dart';

class Queue extends BaseModel {
  final int? id;
  final DoctorSchedule? doctorSchedule;
  final int? queueNo;
  final String? date;
  final int? currentQueue;

  Queue({
    this.id,
    this.doctorSchedule,
    this.queueNo,
    this.date,
    this.currentQueue,
  }) : super({
          'id': id,
          'doctor_schedule': doctorSchedule,
          'queue_no': queueNo,
          'date': date,
          'current_queue': currentQueue,
        });

  factory Queue.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('Null JSON provided');
    }

    return Queue(
      id: json['id'],
      doctorSchedule: DoctorSchedule.fromJson(json['doctor_schedule']),
      queueNo: json['queue_no'],
      date: json['date'],
      currentQueue: json['current_queue'],
    );
  }

  @override
  copyWith({
    int? id,
    DoctorSchedule? doctorSchedule,
    int? queueNo,
    String? date,
    int? currentQueue,
  }) {
    return Queue(
      id: id ?? this.id,
      doctorSchedule: doctorSchedule ?? this.doctorSchedule,
      queueNo: queueNo ?? this.queueNo,
      date: date ?? this.date,
      currentQueue: currentQueue ?? this.currentQueue,
    );
  }
}
