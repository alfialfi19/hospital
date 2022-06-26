import 'package:hospital/common/common.dart';

class QueueRegistration extends BaseModel {
  final int? queue;
  final String? doctorScheduleId;
  final String? date;

  QueueRegistration({
    this.doctorScheduleId,
    this.queue,
    this.date,
  }) : super({
          'doctor_schedule_id': doctorScheduleId,
          'queue': queue,
          'date': date,
        });

  factory QueueRegistration.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('Null JSON provided');
    }

    return QueueRegistration(
      doctorScheduleId: json['doctorScheduleId'],
      queue: json['queue'],
      date: json['date'],
    );
  }

  @override
  copyWith({
    String? doctorScheduleId,
    int? queue,
    String? date,
  }) {
    return QueueRegistration(
      doctorScheduleId: doctorScheduleId ?? this.doctorScheduleId,
      queue: queue ?? this.queue,
      date: date ?? this.date,
    );
  }
}
